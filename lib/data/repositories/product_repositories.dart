import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/cache_manager.dart';
import 'package:flutter/services.dart';

import '../../core/network/api_client.dart';
import '../models/product.dart';

class ProductRepository {
  final ApiClient _apiClient;
  final CustomCacheManager _cacheManager;
  ProductRepository(this._apiClient, this._cacheManager);

  Future<List<Product>> fetchProducts() async {
    try {
      const url = '/products';
      final fileInfo = await _cacheManager.getFileFromCache(url);

      Response response;
      if (fileInfo != null && fileInfo.validTill.isAfter(DateTime.now())) {
        // Use cached data
        final cachedData = await fileInfo.file.readAsString();
        response = Response(
          data: jsonDecode(cachedData),
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
        );
        print("FROM CACHE");
      } else {
        // Fetch from API and cache it
        response = await _apiClient.get('/products');
        final data = utf8.encode(jsonEncode(response.data));
        await _cacheManager.putFile(
          url,
          Uint8List.fromList(data),
          fileExtension: 'json',
        );
        print("FROM API");
      }
      return (response.data as List)
          .map((json) => Product.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
