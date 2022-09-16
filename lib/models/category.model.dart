import 'package:flutter/material.dart';

class Category {
  int? categoryId;
  String? name;
  String? description;
  String? picture;

  Category({this.categoryId, this.name, this.description, this.picture});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    name = json['name'];
    description = json['description'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['categoryId'] = categoryId;
    data['name'] = name;
    data['description'] = description;
    data['picture'] = picture;
    return data;
  }

}

List<Category> categories = [
  Category(
      name: "Burger",
      description: "burger king",
      picture: "assets/test/burger.png"),
  Category(
      name: "Pizza",
      description: "pizza king",
      picture: "assets/test/pizza.png"),
  Category(
      name: "Soup",
      description: "soup king",
      picture: "assets/test/burger.png"),
  Category(
      name: "Cake",
      description: "cake king",
      picture: "assets/test/pizza.png"),
  Category(
      name: "Boisson",
      description: "boisson king",
      picture: "assets/test/burger.png"),
];



