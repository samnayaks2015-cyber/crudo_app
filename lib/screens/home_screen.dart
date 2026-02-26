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
        title: const Text('Crudo Store'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartScreen(),
                    ),
                  );
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
        children: [
          _productTile(context, 'Apple', 120),
          _productTile(context, 'Banana', 60),
          _productTile(context, 'Mango', 150),
          _productTile(context, 'Orange', 80),
        ],
      ),
    );
  }

  Widget _productTile(BuildContext context, String name, double price) {
    return ListTile(
      title: Text(name),
      subtitle: Text('₹$price'),
      trailing: ElevatedButton(
        onPressed: () {
          Provider.of<CartService>(context, listen: false)
              .addItem(name, price);
        },
        child: const Text('Add'),
      ),
    );
  }
}
