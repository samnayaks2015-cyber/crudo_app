import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/cart_service.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUDO'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  'Cart: ${cart.count}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _productTile(
            context,
            name: 'Cow Milk',
            price: 90,
          ),
          _productTile(
            context,
            name: 'Buffalo Milk',
            price: 130,
          ),
        ],
      ),
    );
  }

  Widget _productTile(
    BuildContext context, {
    required String name,
    required double price,
  }) {
    final cart = Provider.of<CartService>(context, listen: false);

    return ListTile(
      title: Text(name),
      subtitle: Text('₹${price.toStringAsFixed(1)}'),
      trailing: ElevatedButton(
        onPressed: () {
          cart.addItem(name, price);
        },
        child: const Text('Add'),
      ),
    );
  }
}
