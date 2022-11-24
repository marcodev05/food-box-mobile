import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart.model.dart';

class CartStorage {
  static const String CART_LIST = "cart-list";
  void storeCartList(List<CartItem> itemList) async {
    var prefs = await SharedPreferences.getInstance();
    List<String> carts = [];
    for (var element in itemList) {
      carts.add(jsonEncode(element));
    }
    prefs.setStringList(CART_LIST, carts);
  }

  Future<List<CartItem>> getCartList() async {
    var prefs = await SharedPreferences.getInstance();
    List<String>? carts = [];
    if (prefs.containsKey(CART_LIST)) {
      carts = prefs.getStringList(CART_LIST);
    }
    List<CartItem> itemList = [];
    for (var element in carts!) {
      itemList.add(CartItem.fromJson(jsonDecode(element)));
    }
    return itemList;
  }
}
