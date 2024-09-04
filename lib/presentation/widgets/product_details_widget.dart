import 'package:flutter/material.dart';

import '../../core/constants/text_styles.dart';
import '../../data/models/product.dart';

class ProductDetailWidget extends StatelessWidget {
  final Product product;

  const ProductDetailWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Product image with error handling
        Image.network(
          product.image ?? "",
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(
                Icons.broken_image,
                size: 100,
                color: Colors.grey,
              ),
            );
          },
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product title
              Text(
                product.title ?? "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              // Product price
              Text(
                "\$${product.price ?? 0}",
                style: TextStyles
                    .priceText, // Assuming TextStyles is defined elsewhere
              ),
              const SizedBox(height: 8.0),
              // Product rating
              Row(
                children: [
                  Row(
                    children: List.generate(
                      5, // Assuming rating is out of 5
                      (index) => Icon(
                        Icons.star,
                        color: index < (product.rating?.rate ?? 0)
                            ? Colors.amber
                            : Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    "(${product.rating?.count ?? 0} reviews)",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              // Product description
              Text(product.description ?? ""),
            ],
          ),
        ),
      ],
    );
  }
}
