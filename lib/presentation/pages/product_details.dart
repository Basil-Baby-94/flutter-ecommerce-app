import 'package:ecommerce_app/core/constants/app_constants.dart';
import 'package:ecommerce_app/logic/product_bloc/product_bloc.dart';
import 'package:ecommerce_app/presentation/widgets/product_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;

  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.kProductDetails),
      ),
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              final matchingProducts = state.products
                  .where((element) => element.id.toString() == id)
                  .toList();
              if (matchingProducts.isEmpty) {
                // Handle the case where no matching products are found
                return const Center(child: Text(AppConstants.kProductNotFound));
              }
              final product = matchingProducts.first;
              return ProductDetailWidget(
                product: product,
              );
            } else if (state is ProductError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
