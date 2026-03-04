import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/cart_service.dart';

class ProductCard extends StatefulWidget {

  final Product product;

  const ProductCard({super.key,required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  final cart = CartService.instance;

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),

      padding: const EdgeInsets.all(12),

      child: Column(

        children: [

          Expanded(child: Image.asset(widget.product.image)),

          Text(widget.product.name,
          style: const TextStyle(fontSize:18,fontWeight:FontWeight.bold)),

          Text("₹${widget.product.price}",
          style: const TextStyle(fontSize:18,color:Colors.green)),

          ElevatedButton(
            onPressed: (){

              setState(() {
                cart.add(widget.product);
              });

            },
            child: const Text("Add"),
          )

        ],

      ),

    );

  }
}
