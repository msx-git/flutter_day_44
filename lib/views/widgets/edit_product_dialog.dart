import 'package:flutter/material.dart';
import 'package:flutter_day_44/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../../controllers/products_controller.dart';
import '../../models/product.dart';

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
