import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_box/helpers/url_utils.dart';
import 'package:food_box/models/cart.model.dart';

import '../../blocs/cart/cart.bloc.dart';
import '../../blocs/cart/cart.event.dart';
import 'bigtext.widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    String picture = UrlUtilsApp.checkUrlPicture(cartItem.menu);
    return Container(
      height: 90,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          /** container image **/
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(picture,
                  height: 60,
                  width: 60,
                ),
              ),
            ]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0, right: 10, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: cartItem.menu.name,
                        size: 16,
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(RemoveItemEvent(cartItem: cartItem));
                        },
                        icon: const Icon(Icons.highlight_remove_outlined,
                            color: Colors.red),
                      ),
                    ],
                  ), //
                  const SizedBox(
                    height: 7,
                  ),
                  //SmallText(text: "burger"),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(DecrementCartItemQuantityEvent(cartItem: cartItem));
                              },
                              icon: const Icon(Icons.remove_circle,
                                  color: Colors.black54),
                            ),
                            /*BlocBuilder<CartBloc, CartsState>(
                                builder: (context, state) {
                              if (state is CartLoadingState) {
                                return const CircularProgressIndicator();
                              }
                              if (state is UpdateQuantitySuccessState) {
                                if (state.cartItem == cartItem) {
                                  return BigText(text: state.qty.toString());
                                } else {
                                  return BigText(
                                      text: cartItem.quantity.toString());
                                }
                              }
                              return BigText(
                                  text: cartItem.quantity.toString());
                            }),*/
                            BigText(text: cartItem.quantity.toString()),
                            IconButton(
                              onPressed: () {
                                context.read<CartBloc>().add(
                                    IncrementCartItemQuantityEvent(
                                        cartItem: cartItem));
                              },
                              icon: const Icon(Icons.add_circle,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        BigText(
                          text: " \$ ${cartItem.menu.price}",
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
