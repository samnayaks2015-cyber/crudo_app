import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CRUDO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0,
      ),

      // ❗ NO bottomNavigationBar here

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔍 Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Search milk, fruits, vegetables...',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🧩 Categories Title
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // 🧩 Categories Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CategoryItem(Icons.local_drink, 'Milk'),
                CategoryItem(Icons.eco, 'Vegetables'),
                CategoryItem(Icons.apple, 'Fruits'),
                CategoryItem(Icons.egg, 'Eggs'),
              ],
            ),

            const SizedBox(height: 28),

            // ⭐ Popular Title
            const Text(
              'Popular',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // 🛒 Product Cards
            const ProductCard(
              name: 'Cow Milk',
              price: '₹90 / litre',
            ),

            const SizedBox(height: 14),

            const ProductCard(
              name: 'Buffalo Milk',
              price: '₹130 / litre',
            ),
          ],
        ),
      ),
    );
  }
}

//
// 🧩 CATEGORY WIDGET
//
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.green, size: 30),
        ),
        const SizedBox(height: 6),
        Text(title),
      ],
    );
  }
}

//
// 🛒 PRODUCT CARD
//
class ProductCard extends StatelessWidget {
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [

          // 🥛 Icon
          Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.local_drink, color: Colors.white),
          ),

          const SizedBox(width: 14),

          // 📦 Name + Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(price),
              ],
            ),
          ),

          // ➕ Add Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
