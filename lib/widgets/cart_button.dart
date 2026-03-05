import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {

  final int cartCount;
  final VoidCallback onPressed;

  const CartButton({
    super.key,
    required this.cartCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(

      children: [

        IconButton(
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
          onPressed: onPressed,
        ),

        if(cartCount > 0)
          Positioned(
            right: 6,
            top: 6,

            child: Container(
              padding: const EdgeInsets.all(4),

              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),

              child: Text(
                cartCount.toString(),

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          )

      ],
    );
  }
}
