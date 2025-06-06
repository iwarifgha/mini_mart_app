import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart_app/common/models/product_model.dart';
import 'package:mini_mart_app/features/cart/state/cart_state.dart'
    show CartState;

class FavoriteState {
  final List<ProductModel> items;

  FavoriteState({required this.items});

  FavoriteState copyWith({List<ProductModel>? items}) {
    return FavoriteState(items: items ?? this.items);
  }
}

class FavoriteStateNotifier extends StateNotifier<FavoriteState> {
  FavoriteStateNotifier() : super(FavoriteState(items: []));

  //check if product is already in cart, if true remove it, if false add it
  void toggleFavorite(ProductModel item) {
    final index = state.items.indexWhere((product) => product.id == item.id);
    if (index > 0) {
      state = state.copyWith(items: [...state.items, item]);
    } else {
      state.items.removeWhere((product) => product.id == item.id);
      state = state.copyWith(items: [...state.items]);
    }
  }

}

final favoriteStateProvider = StateNotifierProvider<FavoriteStateNotifier, FavoriteState>(
  (ref) => FavoriteStateNotifier(),
);