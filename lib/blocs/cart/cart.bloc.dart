import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_box/blocs/cart/cart.event.dart';
import 'package:food_box/models/cart.model.dart';
import 'package:food_box/services/local_service/cart.service.dart';

import 'cart.state.dart';

class CartBloc extends Bloc<CartEvent, CartsState> {
  CartBloc() : super(CartLoadingState()) {
    CartService cartService = CartService();

    on((AddToCartEvent event, Emitter<CartsState> emit) {
      cartService.addToCart(CartItem(
          cartId: event.menu.menuId,
          menu: event.menu,
          quantity: event.quantity));
      emit(CartSuccessState(message: "Appended to cart"));
    });

    on((RemoveItemEvent event, Emitter<CartsState> emit) async {
      emit(CartLoadingState());
      List<CartItem> cartItems =
          await cartService.removeFromCart(event.cartItem);
      double amount = cartService.calculateAmountOfCart(cartItems);
      emit(CartLoadedState(cartItems: cartItems, amount: amount));
    });

    on((LoadCartEvent event, Emitter<CartsState> emit) async {
      List<CartItem> cartItems = await cartService.fetchAllItemsCart();
      double amount = cartService.calculateAmountOfCart(cartItems);
      emit(CartLoadedState(cartItems: cartItems, amount: amount));
    });

    on((IncrementCartItemQuantityEvent event, Emitter<CartsState> emit) async {
      CartItem currentItem = event.cartItem;
      List<CartItem> cartItems = await cartService.fetchAllItemsCart();
      if (currentItem.quantity < currentItem.menu.quantity) {
        currentItem.quantity = currentItem.quantity + 1;
      }
      int index = cartItems.indexWhere(
          (element) => element.cartId == event.cartItem.menu.menuId);
      cartItems[index] = currentItem;
      cartService.saveCartItems(cartItems);
      double amount = cartService.calculateAmountOfCart(cartItems);
      emit(CartLoadedState(cartItems: cartItems, amount: amount));
    });

    on((DecrementCartItemQuantityEvent event, Emitter<CartsState> emit) async {
      CartItem currentItem = event.cartItem;
      List<CartItem> cartItems = await cartService.fetchAllItemsCart();
      if (currentItem.quantity > 1) {
        currentItem.quantity = currentItem.quantity - 1;
      }
      int index = cartItems.indexWhere(
          (element) => element.cartId == event.cartItem.menu.menuId);
      cartItems[index] = currentItem;
      cartService.saveCartItems(cartItems);
      double amount = cartService.calculateAmountOfCart(cartItems);
      emit(CartLoadedState(cartItems: cartItems, amount: amount));
    });
  }
}
