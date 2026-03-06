import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Cart"),
      ),

      body: CartService.cart.isEmpty
          ? const Center(
          child: Text("Cart is empty"))
          : ListView(
        children: CartService.cart.entries.map((item){

          return ListTile(
            title: Text(item.key),
            trailing: Text("Qty: ${item.value}"),
          );

        }).toList(),
      ),
    );
  }
}
