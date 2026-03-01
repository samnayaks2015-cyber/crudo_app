import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  final CartService cart;

  const HomeScreen({super.key, required this.cart});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CartService cart;

  @override
  void initState() {
    super.initState();
    cart = widget.cart;
  }

  // ✅ PRODUCT CARD
  Widget productCard({
    required String name,
    required double price,
    required String image,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '₹${price.toStringAsFixed(0)}',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  cart.addItem(name: name, price: price);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$name added to cart')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD0 Milk'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartScreen(cart: cart),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            productCard(
              name: 'Cow Milk 1L',
              price: 70,
              image: 'assets/images/cow_milk.png',
            ),
            productCard(
              name: 'Buffalo Milk 1L',
              price: 90,
              image: 'assets/images/buffalo_milk.png',
            ),
            productCard(
              name: 'Cow Milk 500ml',
              price: 40,
              image: 'assets/images/cow_milk.png',
            ),
            productCard(
              name: 'Buffalo Milk 500ml',
              price: 50,
              image: 'assets/images/buffalo_milk.png',
            ),
          ],
        ),
      ),
    );
  }
}
