class CartService {
  final List<Map<String, dynamic>> items = [];

  void addItem(String name, double price) {
    items.add({
      'name': name,
      'price': price,
    });
  }
}
