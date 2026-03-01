import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class CartScreen extends StatelessWidget {
  final CartService cart;

  const CartScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final items = cart.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text('Cart is empty'),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]['name']),
                  trailing: Text('₹${items[index]['price']}'),
                );
              },
            ),
    );
  }
}
