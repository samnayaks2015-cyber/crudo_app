import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class HomeScreen extends StatelessWidget {
  final CartService cart;
  final VoidCallback onCartPressed;

  const HomeScreen({
    super.key,
    required this.cart,
    required this.onCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            // 🔥 OPTIONAL LOGO — put your asset here
            Image.asset(
              'assets/logo.png',
              height: 32,
              errorBuilder: (c, e, s) => const Text(
                "CRUDO",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: onCartPressed,
              ),
              if (cart.totalItems > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cart.totalItems.toString(),
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

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: _productCard(
                name: "Cow Milk",
                price: 90,
                image: "assets/cow_milk.png",
                context: context,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _productCard(
                name: "Buffalo Milk",
                price: 130,
                image: "assets/buffalo_milk.png",
                context: context,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productCard({
    required String name,
    required double price,
    required String image,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 90,
            errorBuilder: (c, e, s) =>
                const Icon(Icons.image, size: 80),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "₹${price.toStringAsFixed(1)}",
            style: const TextStyle(
              color: Colors.green,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {
              cart.addItem(name, price);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Added to cart")),
              );
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.purple),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
