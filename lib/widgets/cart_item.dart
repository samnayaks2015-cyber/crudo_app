import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onRemove;

  const CartItem({
    super.key,
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text('₹${item.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onRemove,
      ),
    );
  }
}
