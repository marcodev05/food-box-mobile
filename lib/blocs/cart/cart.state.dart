import 'package:food_box/models/cart.model.dart';

abstract class CartsState {}

class CartSuccessState extends CartsState {
  final String message;
  CartSuccessState({required this.message});
}

class CartErrorState extends CartsState {
  final String message;
  CartErrorState({required this.message});
}

class CartLoadingState extends CartsState {}

class CartLoadedState extends CartsState {
  final List<CartItem> cartItems;
  final double amount;
  CartLoadedState({required this.cartItems, required this.amount});
}

class UpdateQuantitySuccessState extends CartsState {
  final int qty;
  final double mount;
  final CartItem cartItem;
  UpdateQuantitySuccessState({required this.qty, required this.mount, required this.cartItem});
}

class UpdateQuantityErrorState extends CartsState {
  final int qty;
  UpdateQuantityErrorState({required this.qty});
}

class QuantityInitialState extends CartsState {
  int? qty;
  QuantityInitialState({this.qty=0});
}
