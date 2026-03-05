import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const CrudoApp());
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CRUDO",
      theme: AppTheme.lightTheme,
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/home": (context) => const HomeScreen(),
        "/cart": (context) => const CartScreen(),
        "/profile": (context) => const ProfileScreen(),
      },
    );
  }
}
