import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product.dart';
import '../../data/repositories/product_repositories.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc(this.productRepository) : super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<SelectCategory>(_onSelectCategory);
  }

  Future<void> _onLoadProducts(
      LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await productRepository.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void _onSelectCategory(SelectCategory event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final loadedState = state as ProductLoaded;
      emit(loadedState.copyWith(selectedCategory: event.category));
    }
  }
}
