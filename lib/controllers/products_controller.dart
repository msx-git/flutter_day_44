import 'dart:math';

import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductsController with ChangeNotifier {
  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      title: "Samsung Galaxy",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 700,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Google Pixel",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 600,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "OnePlus",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 550,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "MacBook Pro",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 1200,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Dell XPS",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 1100,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "HP Spectre",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 1000,
    ),
  ];

  List<Product> get list {
    return [..._list];
  }

  void addProduct(String title, double price) {
    _list.add(
      Product(
        id: UniqueKey().toString(),
        title: title,
        color: Color.fromARGB(
          255,
          Random().nextInt(200),
          Random().nextInt(200),
          Random().nextInt(200),
        ),
        price: price,
      ),
    );
    notifyListeners();
  }
}
