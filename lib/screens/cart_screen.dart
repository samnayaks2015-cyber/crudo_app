import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class CartScreen extends StatelessWidget {
  final CartService cart;

  const CartScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: cart.items.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];

                      return ListTile(
                        title: Text(item['name']),
                        subtitle:
                            Text("Qty: ${item['quantity']}"),
                        trailing: Text(
                          "₹${(item['price'] * item['quantity']).toStringAsFixed(0)}",
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Total: ₹${cart.totalPrice.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
