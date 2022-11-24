import 'package:flutter/material.dart';

class Category {
  int? categoryId;
  late String name;
  late String description;
  String? picture;
  String? createdAt;

  Category(
      {
        this.categoryId,
        required this.name,
        required this.description,
        this.picture,
        this.createdAt
      });

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    name = json['name'];
    description = json['description'];
    picture = json['picture'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['picture'] = this.picture;
    data['createdAt'] = this.createdAt;
    return data;
  }
}


/*List<Category> categories = [
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
];*/



