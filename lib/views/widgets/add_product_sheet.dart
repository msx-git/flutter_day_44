import 'package:flutter/material.dart';
import 'package:flutter_day_44/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../../controllers/products_controller.dart';

class AddProductSheet extends StatelessWidget {
  AddProductSheet({super.key});

  static final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            12.height,
            const Text(
              'Add product',
              style: TextStyle(fontSize: 18),
            ),
            12.height,
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Title'),
              autofocus: true,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Please, enter the title of the product!";
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
                  return "Please, enter the price of the product!";
                }
                return null;
              },
            ),
            16.height,
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<ProductsController>().addProduct(
                          titleController.text,
                          double.parse(priceController.text),
                        );
                    titleController.clear();
                    priceController.clear();
                    Navigator.pop(context);
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xff303030),
                ),
                child: const Text(
                  'Add product',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            16.height,
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
            )
          ],
        ),
      ),
    );
  }
}
