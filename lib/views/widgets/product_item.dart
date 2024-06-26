import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/cart_controller.dart';
import '../../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ListTile(
      onTap: () {},
      hoverColor: Colors.red,
      leading: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(
            255,
            Random().nextInt(200),
            Random().nextInt(190),
            Random().nextInt(180),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        height: 50,
        width: 50,
        alignment: Alignment.center,
      ),
      title: Text(
        product.title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text("\$${product.price}"),
      trailing: Consumer<CartController>(
        builder: (context, controller, child) {
          return controller.isInCart(product.id)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.removeFromCart(product.id);
                      },
                      icon: const Icon(Icons.remove_circle),
                    ),
                    Text(
                      controller.getProductAmount(product.id).toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: () => controller.addToCart(product),
                  child: const Icon(Icons.shopping_cart_outlined),
                );
        },
      ),
    );
  }
}
