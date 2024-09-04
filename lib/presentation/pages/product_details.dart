import 'package:ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;

  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.kProductDetails),
      ),
      body: Center(
        child: Text(id),
      ),
    );
  }
}
