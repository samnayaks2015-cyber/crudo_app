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
        title: const Text('Crudo Store'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              if (cart.itemCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cart.itemCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ProductTile(name: 'Chicken', price: 220),
          ProductTile(name: 'Mutton', price: 680),
          ProductTile(name: 'Fish', price: 300),
          ProductTile(name: 'Prawns', price: 450),
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

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(name),
        subtitle: Text('₹${price.toStringAsFixed(0)}'),
        trailing: ElevatedButton(
          onPressed: () {
            cart.addItem(name, price);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$name added to cart')),
            );
          },
          child: const Text('Add'),
        ),
      ),
    );
  }
}
