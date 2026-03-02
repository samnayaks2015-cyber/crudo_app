import 'package:flutter/material.dart';
import 'services/cart_service.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CrudoApp());
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Single cart instance for whole app
    final cart = CartService();

    return MaterialApp(
      title: 'CRUDO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xfff5f6fa),
      ),

      // ✅ IMPORTANT — pass cart to HomeScreen
      home: HomeScreen(cart: cart),
    );
  }
}
