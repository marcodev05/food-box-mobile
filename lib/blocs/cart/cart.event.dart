import 'package:food_box/models/cart.model.dart';
import 'package:food_box/models/menu.model.dart';

abstract class CartEvent{}

class AddToCartEvent extends CartEvent{
  final Menu menu;
  final int quantity;
  AddToCartEvent({required this.menu, required this.quantity});
}

class RemoveItemEvent extends CartEvent{
  final CartItem cartItem;
  RemoveItemEvent({required this.cartItem});
}

class IncrementCartItemQuantityEvent extends CartEvent{
  final CartItem cartItem;
  IncrementCartItemQuantityEvent({required this.cartItem});
}

class DecrementCartItemQuantityEvent extends CartEvent{
  final CartItem cartItem;
  DecrementCartItemQuantityEvent({required this.cartItem});
}


class LoadCartEvent extends CartEvent{}
