import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_44/controllers/orders_controller.dart';
import 'package:flutter_day_44/models/order.dart';
import 'package:flutter_day_44/views/screens/orders_screen.dart';
import 'package:provider/provider.dart';

import '../../controllers/cart_controller.dart';
import '../../models/product.dart';
import '../widgets/product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CartController>().emptyCart();
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: cartController.cart.products.isEmpty
          ? const Center(
              child: Text("Cart is empty"),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartController.cart.products.length,
                    itemBuilder: (ctx, index) {
                      final product = cartController.cart.products.values
                          .toList()[index]['product'];
                      return ChangeNotifierProvider<Product>.value(
                        value: product,
                        builder: (context, child) {
                          return ProductItem(product: product, isInCart: true);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsetsDirectional.all(20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$${cartController.cart.totalPrice}",
                        style: const TextStyle(fontSize: 25),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<OrdersController>().addOrder(
                                order: Order(
                                  id: UniqueKey().toString(),
                                  products: cartController.getProducts(),
                                  date: DateTime.now(),
                                ),
                              );
                          context.read<CartController>().emptyCart();
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) {
                                return const OrdersScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Buy",
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   shape: const RoundedRectangleBorder(),
      //   onPressed: () {},
      //   label: Text(
      //     "\$${cartController.cart.totalPrice}",
      //     style: const TextStyle(
      //       fontSize: 30,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    );
  }
}
