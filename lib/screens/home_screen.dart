import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUDO'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text('Cart: ${cart.itemCount}'),
            ),
          ),
        ],
      ),
      body: ListView(
        children: const [
          ProductTile(name: 'Cow Milk', price: 90),
          ProductTile(name: 'Buffalo Milk', price: 130),
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final String name;
  final double price;

  const ProductTile({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context, listen: false);

    return ListTile(
      title: Text(name),
      subtitle: Text('₹$price'),
      trailing: ElevatedButton(
        onPressed: () {
          cart.addItem(name, price);
        },
        child: const Text('Add'),
      ),
    );
  }
}
