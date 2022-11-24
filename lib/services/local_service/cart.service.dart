import 'package:food_box/models/cart.model.dart';

import '../../helpers/cart.storage.dart';

class CartService {
  CartStorage cartStorage = CartStorage();

  void addToCart(CartItem cartItem) async {
    List<CartItem> cartList = await cartStorage.getCartList();
    cartList.removeWhere((element) => element.cartId == cartItem.cartId);
    cartList.add(cartItem);
    cartStorage.storeCartList(cartList);
  }

  Future<List<CartItem>> saveCartItems(List<CartItem> cartItems) async {
    cartStorage.storeCartList(cartItems);
    List<CartItem> cartList = await cartStorage.getCartList();
    return cartList;
  }

  Future<List<CartItem>> removeFromCart(CartItem cart) async {
    List<CartItem> cartList = await cartStorage.getCartList();
    cartList.removeWhere((element) => element.cartId == cart.cartId);
    cartStorage.storeCartList(cartList);
    return cartList;
  }

  Future<List<CartItem>> fetchAllItemsCart() async {
    List<CartItem> cartList = await cartStorage.getCartList();
    return cartList;
  }

  double calculateAmountOfCart(List<CartItem> cartItems){
    double total = 0.0;
    for (CartItem element in cartItems) {
      total = total + (element.quantity * element.menu.price);
    }
    return total;
  }
}
