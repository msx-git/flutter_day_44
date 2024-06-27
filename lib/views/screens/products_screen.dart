import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_44/views/screens/orders_screen.dart';
import 'package:provider/provider.dart';

import '../../controllers/products_controller.dart';
import '../../models/product.dart';
import '../widgets/add_product_sheet.dart';
import '../widgets/product_item.dart';
import 'cart_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductsController>().list;
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
                  builder: (context) => const OrdersScreen(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
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
      body: products.isEmpty
          ? const Center(
              child: Text(
                "No products\n\nTo add a product click  +  button",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 70, left: 10, right: 10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ChangeNotifierProvider<Product>.value(
                  value: product,
                  builder: (context, child) {
                    return ProductItem(
                      product: product,
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddProductSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
