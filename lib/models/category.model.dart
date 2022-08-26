import 'dart:core';

import 'package:flutter/material.dart';

class Category{
  String name;
  String description;
  String picture;
  Category({
    required this.name,
    required this.description,
    required this.picture,
  });
}

List<Category> categories = [
  Category(name: "Burger", description: "burger king", picture: "assets/test/burger.png"),
  Category(name: "Pizza", description: "pizza king", picture: "assets/test/pizza.png"),
  Category(name: "Soup", description: "soup king", picture: "assets/test/burger.png"),
  Category(name: "Cake", description: "cake king", picture: "assets/test/pizza.png"),
  Category(name: "Boisson", description: "boisson king", picture: "assets/test/burger.png"),
];