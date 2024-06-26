import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/products_controller.dart';
import '../../models/product.dart';
import '../widgets/product_item.dart';
import 'cart_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = ProductsController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff303030),
        foregroundColor: const Color(0xffFFFFFF),
        title: const Text("Catalog"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (ctx) {
                    return const CartScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: productsController.list.length,
        itemBuilder: (context, index) {
          final product = productsController.list[index];
          return ChangeNotifierProvider<Product>.value(
            value: product,
            builder: (context, child) {
              return const ProductItem();
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
      ),
    );
  }
}
