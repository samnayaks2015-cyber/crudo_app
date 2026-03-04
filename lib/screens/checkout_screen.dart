import 'package:flutter/material.dart';
import 'success_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text("Checkout")),

      body: Center(

        child: ElevatedButton(

          child: const Text("Place Order"),

          onPressed: (){

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const SuccessScreen())
            );

          },

        ),

      ),

    );

  }
}
