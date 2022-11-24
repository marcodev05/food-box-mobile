import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_box/blocs/cart/cart.bloc.dart';
import 'package:food_box/ui/widgets/bigtext.widget.dart';
import 'package:food_box/ui/widgets/smalltext.widget.dart';

import '../../../../blocs/cart/cart.event.dart';
import '../../../../blocs/counter/counter.bloc.dart';
import '../../../../blocs/counter/counter.event.dart';
import '../../../../blocs/counter/counter.state.dart';
import '../../../../models/menu.model.dart';
import '../../../widgets/icon.and.text.widget.dart';
import 'package:food_box/helpers/url_utils.dart';

class MenuDetails extends StatelessWidget {
  final Menu menu;
  const MenuDetails({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int qty = 1;
    String picture = UrlUtilsApp.checkUrlPicture(menu);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 250,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 200,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFFECC9),
                      blurRadius: 5.0,
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Color(0xFFFFECC9),
                      blurRadius: 5.0,
                      offset: Offset(-5, -5),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.network(picture,
                          height: 250,
                          width: 200,
                      ),
                    ),
                  ]),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.maxFinite,
              height: 300,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: BigText(text: menu.name)),
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        IconWithText(
                          icon: Icons.circle_sharp,
                          text: 'size',
                          iconColor: Colors.green,
                        ),
                        IconWithText(
                          icon: Icons.timer,
                          text: '32min',
                          iconColor: Colors.yellow,
                        ),
                        IconWithText(
                          icon: Icons.star,
                          text: '4.5',
                          iconColor: Colors.orangeAccent,
                        ),
                      ]),
                  const SizedBox(height: 30),
                  Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: "Detail",
                              size: 16,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<CounterBloc>()
                                        .add(ReduceQuantityEvent());
                                  },
                                  icon: const Icon(Icons.remove_circle,
                                      color: Colors.black54),
                                ),
                                BlocBuilder<CounterBloc, CounterState>(
                                    builder: (context, state) {
                                  if (state is QuantitySuccessState) {
                                    qty = state.qty;
                                    return BigText(text: state.qty.toString());
                                  } else if (state is QuantityErrorState) {
                                    qty = state.qty;
                                    return BigText(text: state.qty.toString());
                                  } else {
                                    return BigText(text: "1");
                                  }
                                }),
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<CounterBloc>()
                                        .add(IncrementQuantityEvent(menu: menu));
                                  },
                                  icon: const Icon(Icons.add_circle,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ])),
                  const SizedBox(height: 15),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SmallText(text: menu.description))
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        color: Colors.red,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 35),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SmallText(
                    text: '\$',
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  BigText(
                    text: menu.price.toString(),
                    size: 24,
                    color: Colors.white,
                  )
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                context
                    .read<CartBloc>()
                    .add(AddToCartEvent(menu: menu, quantity: qty));
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
                        text: "Add to Cart",
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
