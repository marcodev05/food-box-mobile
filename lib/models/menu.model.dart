import 'package:flutter/material.dart';

class Menu {
  String name;
  String description;
  int price;
  int quantity;

  Menu({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });
}

List<Menu> menus = [
  Menu(name: "pizza fruit",
  description: "avec tomate et beurre",
  price: 300,
  quantity: 7
  ),
  Menu(name: "tacos poulet",
      description: "avec des beurres",
      price: 500,
      quantity: 5
  ),
  Menu(name: "Boule de neige",
      description: "avec des chocolats",
      price: 100,
      quantity: 8
  ),
];