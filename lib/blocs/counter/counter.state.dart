import 'package:food_box/models/cart.model.dart';

abstract class CounterState {
  final int qty;
  CounterState({required this.qty});
}

class QuantitySuccessState extends CounterState {
  QuantitySuccessState({required super.qty});
}

class QuantityErrorState extends CounterState {
  QuantityErrorState({required super.qty});
}

class QuantityInitialState extends CounterState {
  QuantityInitialState({required super.qty});

}
