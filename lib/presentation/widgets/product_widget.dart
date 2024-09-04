import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.blue.withOpacity(0.2)),
        ),
        leading: SizedBox(
            width: 50, height: 50, child: Image.network(product.image ?? "")),
        title: Text(product.title ?? ""),
        subtitle: Text('\$${product.price}'),
        onTap: () => context.go('/product/${product.id}'),
      ),
    );
  }
}
