import 'package:flutter/material.dart';
import 'package:food_box/models/category.model.dart';

// app.quicktype.io

class Menu {
  int? menuId;
  late String name;
  late String description;
  late int quantity;
  late double price;
  String? picture;
  bool? available;
  Category? category;
  String? createdAt;

  Menu(
      {
        this.menuId,
        required this.name,
        required this.description,
        required this.quantity,
        required this.price,
        this.picture,
        this.available,
        required this.category,
        this.createdAt});

  Menu.fromJson(Map<String, dynamic> json) {
    menuId = json['menuId'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    picture = json['picture'];
    available = json['available'];
    if(json['category'] != null){
      category = Category.fromJson(json['category']);
    }
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['menuId'] = this.menuId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['picture'] = this.picture;
    data['available'] = this.available;
    if (category != null) {
      data['category'] = this.category?.toJson();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}


/*List<Menu> menus = [
  Menu(
      name: "pizza fruit",
      description: "avec tomate et beurre",
      price: 300,
      quantity: 7,
      picture: "assets/test/pizza.png"),
  Menu(
      name: "tacos poulet",
      description: "avec des beurres",
      price: 500,
      quantity: 5,
      picture: "assets/test/burger.png"),
  Menu(
      name: "Boule de neige",
      description: "avec des chocolats",
      price: 100,
      quantity: 8,
      picture: "assets/test/burger.png")
];*/

