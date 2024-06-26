import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_day_44/controllers/products_controller.dart';
import 'package:flutter_day_44/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../../controllers/cart_controller.dart';
import '../../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, this.isInCart = false});

  final Product product;
  final bool isInCart;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap: () {},
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
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("\$${product.price}"),
          Visibility(
            visible: !isInCart,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<ProductsController>()
                          .deleteProduct(product.id);
                    },
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return EditProductDialog(
                            product: product,
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      isThreeLine: true,

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

class EditProductDialog extends StatefulWidget {
  const EditProductDialog({super.key, required this.product});

  final Product product;

  @override
  State<EditProductDialog> createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> {
  late final TextEditingController titleController;
  late final TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.product.title);
    priceController =
        TextEditingController(text: widget.product.price.toString());
  }

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Product"),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Please, enter new title of the product!";
                }
                return null;
              },
            ),
            12.height,
            TextFormField(
              controller: priceController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Price'),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Please, enter new price of the product!";
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<ProductsController>().editProduct(
                    id: widget.product.id,
                    title: titleController.text,
                    price: double.parse(priceController.text),
                  );
              priceController.clear();
              titleController.clear();
              Navigator.pop(context);
            }
          },
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.teal),
          ),
        ),
      ],
    );
  }
}
