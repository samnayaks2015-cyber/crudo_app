import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartService extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  // ✅ ADD ITEM
  void addItem(String name, double price) {
    if (_items.containsKey(name)) {
      _items[name]!.quantity++;
    } else {
      _items[name] = CartItem(name: name, price: price);
    }
    notifyListeners();
  }

  // ✅ REMOVE ITEM
  void removeItem(String name) {
    if (!_items.containsKey(name)) return;

    if (_items[name]!.quantity > 1) {
      _items[name]!.quantity--;
    } else {
      _items.remove(name);
    }
    notifyListeners();
  }

  // ✅ TOTAL ITEMS (for badge)
  int get totalItems {
    int total = 0;
    for (var item in _items.values) {
      total += item.quantity;
    }
    return total;
  }

  // ✅ TOTAL PRICE
  double get totalPrice {
    double total = 0;
    for (var item in _items.values) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
