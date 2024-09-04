import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/endpoints.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: Endpoints.baseUrl));

  Future<Response> get(String endpoint) async {
    return await _dio.get(endpoint);
  }
}
