import 'package:dio/dio.dart';

import '../../core/network/api_client.dart';
import '../models/product.dart';

class ProductRepository {
  final ApiClient _apiClient;

  ProductRepository(this._apiClient);

  Future<List<Product>> fetchProducts() async {
    try {
      Response response = await _apiClient.get('/products');
      return (response.data as List)
          .map((json) => Product.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
