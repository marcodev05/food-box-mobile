import 'package:bloc/bloc.dart';
import 'package:food_box/services/local_service/cart.service.dart';

import 'counter.event.dart';
import 'counter.state.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(QuantityInitialState(qty: 1)) {
    CartService cartService = CartService();

    on((IncrementQuantityEvent event, Emitter<CounterState> emit) async {
      //List<CartItem> cartItems = await cartService.fetchAllItemsCart();
      if(state.qty < event.menu.quantity){
        int count = state.qty + 1;
        //double mount = count * event.menu.price;
        emit(QuantitySuccessState(qty: count));
      }else{
        int count = state.qty;
        emit(QuantityErrorState(qty: count));
      }

    });

    on((ReduceQuantityEvent event, Emitter<CounterState> emit) async {
      //List<CartItem> cartItems = await cartService.fetchAllItemsCart();
      if(state.qty > 1){
        int count = state.qty - 1;
        //double mount = count * event.menu.price;
        emit(QuantitySuccessState(qty: count));
      }else{
        int count = state.qty;
        emit(QuantityErrorState(qty: count));
      }
    });

    on((InitQuantityEvent event, Emitter<CounterState> emit) async {
        emit(QuantitySuccessState(qty: 1));
    });

/*    on((ReduceQuantityEvent event, Emitter<CartsState> emit) async {
      //List<CartItem> cartItems = await cartService.fetchAllItemsCart();
      int count;
      if(event.qty<=event.menu.quantity) {
        count = event.qty - 1;
        double mount = count * event.menu.price;
        emit(QuantitySuccessState(qty: count, mount: mount));
      }else{
        count = event.qty;
        emit(QuantityErrorState(qty: count));
      }
    });*/
  }
}
