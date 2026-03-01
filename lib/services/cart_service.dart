class CartService {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem({required String name, required double price}) {
    _items.add({
      'name': name,
      'price': price,
    });
  }

  void clearCart() {
    _items.clear();
  }
}
