part of 'product_bloc.dart';

class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final List<String> categories;
  final String? selectedCategory;
  ProductLoaded(this.products, {this.selectedCategory})
      : categories = products.map((p) => p.category ?? "").toSet().toList();

  ProductLoaded copyWith({
    List<Product>? products,
    String? selectedCategory,
  }) {
    return ProductLoaded(
      products ?? this.products,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  List<Product> get filteredProducts {
    if (selectedCategory == null || selectedCategory!.isEmpty) {
      return products;
    }
    return products.where((p) => p.category == selectedCategory).toList();
  }
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
