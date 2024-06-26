import 'dart:math';

import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductsController {
  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      title: "iPhone",
      color: Color.fromARGB(
        255,
        Random().nextInt(200),
        Random().nextInt(200),
        Random().nextInt(200),
      ),
      price: 650,
    ),
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
    Product(
      id: UniqueKey().toString(),
      title: "Lenovo ThinkPad",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 900,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "iPad Pro",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 800,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Samsung Tab",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 750,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Sony WH-1000XM4",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 350,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Bose QuietComfort",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 300,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "JBL Flip",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 100,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Amazon Echo",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 90,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Google Nest",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 80,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Apple Watch",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 400,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Samsung Galaxy Watch",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 350,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Fitbit Charge",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 150,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "GoPro Hero",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 300,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Canon EOS",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 800,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Nikon D3500",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 600,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Sony Alpha",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 900,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "DJI Mavic",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 1000,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Microsoft Surface",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 1100,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Razer Blade",
      color: Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
          Random().nextInt(200)),
      price: 1500,
    ),
    Product(
        id: UniqueKey().toString(),
        title: "Ergonomic Keyboard",
        color: const Color.fromARGB(255, 128, 181, 247),
        price: 723.45),
    Product(
        id: UniqueKey().toString(),
        title: "Noise-Cancelling Headphones",
        color: const Color.fromARGB(255, 34, 139, 34),
        price: 289.99),
    Product(
        id: UniqueKey().toString(),
        title: "Smart Watch",
        color: const Color.fromARGB(255, 0, 176, 255),
        price: 499.00),
    Product(
        id: UniqueKey().toString(),
        title: "Portable Projector",
        color: const Color.fromARGB(255, 255, 215, 0),
        price: 378.12),
    Product(
        id: UniqueKey().toString(),
        title: "Wireless Charger",
        color: const Color.fromARGB(255, 85, 85, 85),
        price: 34.50),
    Product(
        id: UniqueKey().toString(),
        title: "Coffee Maker",
        color: const Color.fromARGB(255, 220, 20, 60),
        price: 159.95),
    Product(
        id: UniqueKey().toString(),
        title: "Air Purifier",
        color: const Color.fromARGB(255, 173, 216, 230),
        price: 521.78),
    Product(
        id: UniqueKey().toString(),
        title: "Drone with Camera",
        color: const Color.fromARGB(255, 102, 102, 102),
        price: 895.33),
    Product(
        id: UniqueKey().toString(),
        title: "VR Headset",
        color: const Color.fromARGB(255, 44, 62, 80),
        price: 642.09),
    Product(
        id: UniqueKey().toString(),
        title: "Instant Camera",
        color: const Color.fromARGB(255, 255, 165, 0),
        price: 239.87),
    Product(
        id: UniqueKey().toString(),
        title: "Robot Vacuum Cleaner",
        color: const Color.fromARGB(255, 0, 0, 0),
        price: 799.00),
    Product(
        id: UniqueKey().toString(),
        title: "Portable Speaker",
        color: const Color.fromARGB(255, 238, 130, 238),
        price: 187.65),
    Product(
        id: UniqueKey().toString(),
        title: "Mechanical Keyboard",
        color: const Color.fromARGB(255, 139, 69, 19),
        price: 215.99),
    Product(
        id: UniqueKey().toString(),
        title: "3D Printer",
        color: const Color.fromARGB(255, 255, 165, 0),
        price: 849.50),
    Product(
        id: UniqueKey().toString(),
        title: "Electric Scooter",
        color: const Color.fromARGB(255, 0, 128, 0),
        price: 589.24),
    Product(
        id: UniqueKey().toString(),
        title: "Noise-Cancelling Earbuds",
        color: const Color.fromARGB(255, 255, 255, 255),
        price: 199.00),
  ];

  List<Product> get list {
    return [..._list];
  }
}
