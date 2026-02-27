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
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(String name, double price) {
    final index = _items.indexWhere((item) => item.name == name);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(name: name, price: price));
    }

    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
