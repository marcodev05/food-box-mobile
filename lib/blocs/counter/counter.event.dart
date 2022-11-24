import 'package:food_box/models/cart.model.dart';
import 'package:food_box/models/menu.model.dart';

abstract class CounterEvent{}

class IncrementQuantityEvent extends CounterEvent{
  final Menu menu;
  IncrementQuantityEvent({required this.menu});
}

class ReduceQuantityEvent extends CounterEvent{
  //final Menu menu;
  //final int qty;
  //ReduceQuantityEvent({required this.menu, required this.qty});
}

class InitQuantityEvent extends CounterEvent{
  // IncrementQuantityEvent({required this.menu, this.qty=1});
}