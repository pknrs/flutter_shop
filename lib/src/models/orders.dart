import 'package:flutter/material.dart';

class Orders extends ChangeNotifier {
  final List<int> _orderItems = [];

  List<int> get items => _orderItems;

  void add(int itemNo) {
    _orderItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _orderItems.remove(itemNo);
    notifyListeners();
  }
}
