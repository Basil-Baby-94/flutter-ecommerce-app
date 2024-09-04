import 'package:ecommerce_app/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/api_client.dart';
import 'data/repositories/product_repositories.dart';
import 'logic/product_bloc/product_bloc.dart';

void main() {
  final apiClient = ApiClient();
  final productRepository = ProductRepository(apiClient);
  runApp(MainApp(
    productRepository: productRepository,
  ));
}

class MainApp extends StatelessWidget {
  final ProductRepository productRepository;
  const MainApp({super.key, required this.productRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(
            productRepository,
          )..add(LoadProducts()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
