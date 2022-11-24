import 'package:equatable/equatable.dart';
import 'package:food_box/models/menu.model.dart';

class CartItem extends Equatable{
  int? cartId;
  late Menu menu;
  late int quantity;

  CartItem({
    this.cartId,
    required this.menu,
    required this.quantity,
  });


  CartItem.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    quantity = json['quantity'];
    menu = Menu.fromJson(json['menu']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cartId'] = cartId;
    data['quantity'] = quantity;
    data['menu'] = menu!.toJson();
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
  
}
