import 'package:flutter/material.dart';
import '../../data/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
            width: 50, height: 50, child: Image.network(product.image ?? "")),
        title: Text(product.title ?? ""),
        subtitle: Text('\$${product.price}'),
      ),
    );
  }
}
