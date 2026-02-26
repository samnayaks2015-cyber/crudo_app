import 'package:flutter/material.dart';

void main() {
  runApp(const CrudoApp());
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUDO',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fa),
      appBar: AppBar(
        title: const Text('CRUDO'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 🔶 LOGO HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.green.shade50,
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 80,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Fresh Milk Delivery',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),

          // 🔶 PRODUCT LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ProductCard(
                  name: 'Cow Milk',
                  price: '₹90 / litre',
                  icon: Icons.local_drink,
                ),
                ProductCard(
                  name: 'Buffalo Milk',
                  price: '₹130 / litre',
                  icon: Icons.local_drink,
                ),
                ProductCard(
                  name: 'Fresh Curd',
                  price: '₹60 / kg',
                  icon: Icons.icecream,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final IconData icon;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade100,
          child: Icon(icon, color: Colors.green),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(price),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          onPressed: () {},
          child: const Text('Buy'),
        ),
      ),
    );
  }
}
