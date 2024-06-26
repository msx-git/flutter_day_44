import 'package:flutter/material.dart';
import 'package:flutter_day_44/controllers/products_controller.dart';
import 'package:provider/provider.dart';

import 'controllers/cart_controller.dart';
import 'views/screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) {
          return CartController();
        }),
        ChangeNotifierProvider(create: (ctx) {
          return ProductsController();
        }),
      ],
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProductsScreen(),
        );
      },
    );
  }
}
