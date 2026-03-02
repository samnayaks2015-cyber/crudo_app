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

class CartService {
  final Map<String, CartItem> items = {};

  // ✅ ADD ITEM
  void addItem(String name, double price) {
    if (items.containsKey(name)) {
      items[name]!.quantity++;
    } else {
      items[name] = CartItem(
        name: name,
        price: price,
        quantity: 1,
      );
    }
  }

  // ✅ REMOVE ITEM
  void removeItem(String name) {
    if (!items.containsKey(name)) return;

    if (items[name]!.quantity > 1) {
      items[name]!.quantity--;
    } else {
      items.remove(name);
    }
  }

  // ✅ TOTAL ITEMS COUNT (for badge)
  int get totalItems {
    int total = 0;
    for (var item in items.values) {
      total += item.quantity;
    }
    return total;
  }

  // ✅ TOTAL PRICE
  double get totalPrice {
    double total = 0;
    for (var item in items.values) {
      total += item.price * item.quantity;
    }
    return total;
  }

  // ✅ CLEAR CART
  void clearCart() {
    items.clear();
  }
}
