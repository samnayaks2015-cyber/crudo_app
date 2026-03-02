class CartService {
  final Map<String, Map<String, dynamic>> _items = {};

  /// ADD ITEM
  void addItem(String name, double price) {
    if (_items.containsKey(name)) {
      _items[name]!['quantity'] += 1;
    } else {
      _items[name] = {
        'name': name,
        'price': price,
        'quantity': 1,
      };
    }
  }

  /// REMOVE ITEM
  void removeItem(String name) {
    if (!_items.containsKey(name)) return;

    if (_items[name]!['quantity'] > 1) {
      _items[name]!['quantity'] -= 1;
    } else {
      _items.remove(name);
    }
  }

  /// CLEAR CART
  void clearCart() {
    _items.clear();
  }

  /// GET ITEMS LIST
  List<Map<String, dynamic>> get items => _items.values.toList();

  /// TOTAL PRICE
  double get totalPrice {
    double total = 0;
    for (var item in _items.values) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  /// TOTAL ITEM COUNT (for badge)
  int get totalItems {
    int count = 0;
    for (var item in _items.values) {
      count += item['quantity'] as int;
    }
    return count;
  }
}
