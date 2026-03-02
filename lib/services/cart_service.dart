import '../models/cart_item.dart';

class CartService {
  static final CartService instance = CartService._internal();

  factory CartService() => instance;

  CartService._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem({required String name, required double price}) {
    try {
      final existing = _items.firstWhere((e) => e.name == name);
      existing.quantity++;
    } catch (e) {
      _items.add(CartItem(name: name, price: price));
    }
  }

  double get total =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
}
