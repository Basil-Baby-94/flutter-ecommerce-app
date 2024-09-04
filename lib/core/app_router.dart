import 'package:go_router/go_router.dart';

import '../presentation/pages/product_details.dart';
import '../presentation/pages/product_list.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const ProductListPage(),
        routes: [
          GoRoute(
            path: 'product/:id',
            builder: (context, state) =>
                ProductDetailPage(id: state.pathParameters['id']!),
          ),
        ]),
  ],
);
