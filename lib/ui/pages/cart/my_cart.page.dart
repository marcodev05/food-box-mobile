import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_box/blocs/cart/cart.bloc.dart';
import 'package:food_box/blocs/cart/cart.state.dart';

import '../../../models/cart.model.dart';
import '../../widgets/bigtext.widget.dart';
import '../../widgets/cart.item.widget.dart';
import '../../widgets/smalltext.widget.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartItem> items = <CartItem>[];
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: BigText(text: "My cart"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15.0),
        width: double.maxFinite,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        child: BlocBuilder<CartBloc, CartsState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is CartLoadedState) {

              items = state.cartItems;
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    CartItem cartItem = items[index];
                    return CartItemWidget(
                      cartItem: cartItem,
                    );
                  });
            }
            return BigText(text: "your cart is empty");
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        color: Colors.red,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: BlocBuilder<CartBloc, CartsState>(
                    builder: (context, state) {
                      if (state is CartLoadingState) {
                        return Container();
                      }
                      if (state is CartLoadedState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Row(
                                children: [
                                  SmallText(text: "Total", color: Colors.white,),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SmallText(
                                  text: '\$',
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                BigText(
                                  text: state.amount.toStringAsFixed(2),
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      else {
                        return BigText(
                        text: "0.0",
                        color: Colors.white,
                        size: 24,
                      );
                      }
                    },
                  )),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed('/maps');
              },
              child: Container(
                  margin: const EdgeInsets.only(right: 30),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  height: 35,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Row(
                    children: [
                      BigText(
                        text: "Checkout",
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
