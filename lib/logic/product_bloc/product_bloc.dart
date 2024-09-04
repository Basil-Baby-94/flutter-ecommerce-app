import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product.dart';
import '../../data/repositories/product_repositories.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc(this.productRepository) : super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
      LoadProducts event, Emitter<ProductState> emit) async {
    print("ONLOADING PRODUCT");
    emit(ProductLoading());
    try {
      final products = await productRepository.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
