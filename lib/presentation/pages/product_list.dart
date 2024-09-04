import 'package:ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/product_bloc/product_bloc.dart';
import '../widgets/category_picker_widget.dart';
import '../widgets/product_widget.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.kProduct)),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return Column(
              children: [
                // Top padding and alignment
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      CategoryPicker(
                        selectedCategory: state.selectedCategory,
                        categories: state.categories,
                        onCategorySelected: (category) {
                          context
                              .read<ProductBloc>()
                              .add(SelectCategory(category));
                        },
                      ),
                    ],
                  ),
                ),
                // Expanded list view for products
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.filteredProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                          product: state.filteredProducts[index]);
                    },
                  ),
                ),
              ],
            );
          } else if (state is ProductError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
