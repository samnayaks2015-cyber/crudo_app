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
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Text(
                  'Cart: ${cart.itemCount}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _productTile(context, 'Cow Milk', 90),
          _productTile(context, 'Buffalo Milk', 130),
        ],
      ),
    );
  }

  Widget _productTile(BuildContext context, String name, double price) {
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
