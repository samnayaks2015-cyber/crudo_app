import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(String name, double price) {
    final index = _items.indexWhere((e) => e.name == name);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(name: name, price: price));
    }

    notifyListeners();
  }

  void removeItem(String name) {
    _items.removeWhere((e) => e.name == name);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // ✅ REQUIRED BY UI
  int get itemCount {
    int count = 0;
    for (var item in _items) {
      count += item.quantity;
    }
    return count;
  }

  // ✅ REQUIRED BY UI
  double get totalAmount {
    double total = 0;
    for (var item in _items) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
