import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'services/cart_service.dart';

void main() {
  runApp(const CrudoApp());
}

class CrudoApp extends StatefulWidget {
  const CrudoApp({super.key});

  @override
  State<CrudoApp> createState() => _CrudoAppState();
}

class _CrudoAppState extends State<CrudoApp> {
  final CartService cart = CartService();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(cart: cart),
      CartScreen(cart: cart),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUDO',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: screens[_selectedIndex],

        // ✅ BOTTOM NAVIGATION BAR (Country Delight style)
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
