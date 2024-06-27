import 'package:flutter/material.dart';

import '../models/order.dart';

class OrdersController extends ChangeNotifier {
  final List<Order> _list = [];

  List<Order> get list {
    return [..._list];
  }

  void addOrder({required Order order}) {
    _list.add(order);
    notifyListeners();
  }
}
