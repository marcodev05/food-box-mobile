import 'package:bloc/bloc.dart';
import 'package:food_box/blocs/cart/cart.event.dart';

import 'cart.state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoadingState()) {
    on((AddToCartEvent event, Emitter<CartState> emit) {
      /* add item to cart */
      print("food added");
    });

    on((RemoveItemEvent event, Emitter<CartState> emit) {
      /* delete item from cart */
      print("food deleted");
    });
  }
}
