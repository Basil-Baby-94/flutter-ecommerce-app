import 'package:ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/color_constants.dart';
import '../../logic/product_bloc/product_bloc.dart';
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
                      DropdownButton<String>(
                        value: state.selectedCategory,
                        hint: const Text(AppConstants.kSelectCategory),
                        items: state.categories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category.toUpperCase()),
                          );
                        }).toList(),
                        onChanged: (category) {
                          context
                              .read<ProductBloc>()
                              .add(SelectCategory(category));
                        },
                        style: const TextStyle(
                          color: ColorConstants
                              .primaryColor, // Text color in dropdown
                          fontSize: 16,
                        ),
                        dropdownColor: Colors
                            .deepPurple.shade50, // Dropdown background color
                        icon: const Icon(Icons.arrow_drop_down,
                            color: ColorConstants.primaryColor),
                        underline: Container(
                          height: 2,
                          color: ColorConstants.primaryColor,
                        ),
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
