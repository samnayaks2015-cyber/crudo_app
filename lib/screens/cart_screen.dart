import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context);

    final products = [
      {
        'name': 'Cow Milk',
        'price': 90.0,
        'image': 'assets/images/cow_milk.png'
      },
      {
        'name': 'Buffalo Milk',
        'price': 130.0,
        'image': 'assets/images/buffalo_milk.png'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUDO'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const CartScreen()),
                  );
                },
              ),
              if (cart.count > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cart.count.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(product['image'] as String, height: 90),
                  Text(
                    product['name'] as String,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₹${product['price']}',
                    style: const TextStyle(
                        fontSize: 16, color: Colors.green),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cart.addItem(
                        name: product['name'] as String,
                        price: product['price'] as double,
                      );
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
