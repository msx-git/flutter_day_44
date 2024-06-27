import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../controllers/orders_controller.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<OrdersController>().list;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final date = orders[index].date;
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                  '${index + 1}. ${DateFormat('dd MMMM, yyyy hh:mm').format(date)}'),
              children: [
                ...List.generate(
                  orders[index].products.length,
                  (index2) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                            "${orders[index].products[index2].title}    ${NumberFormat.simpleCurrency().format(orders[index].products[index2].price)}"),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
// Text(
//               '${date.day}-${date.month}-${date.year} ${date.hour}:${date.minute}')
