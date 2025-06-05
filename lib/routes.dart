import 'package:go_router/go_router.dart';
import 'package:mini_mart_app/base.dart';
import 'package:mini_mart_app/common/models/product_model.dart';
import 'package:mini_mart_app/features/cart/view/cart_view.dart';
import 'package:mini_mart_app/features/details/view/product_details_view.dart';
import 'package:mini_mart_app/features/home/view/home.dart';

final navigationRoutes = GoRouter(
  initialLocation: Base.routeName,
  routes: [
     GoRoute(
      path: Base.routeName,
      builder: (context, state) => const Base(),
    ),
    // GoRoute(
    //   path: HomeView.routeName,
    //   builder: (context, state) => const HomeView(),
    // ),
    GoRoute(
      path: ProductDetailView.routeName,
      builder: (context, state) {
        final product = state.extra as ProductModel;
        return ProductDetailView(product: product);
      },
    ),
    // GoRoute(
    //   path: CartView.routeName,
    //   builder: (context, state) => const CartView(),
    // ),
  ],
);
