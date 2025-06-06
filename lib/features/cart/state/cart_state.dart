import 'package:mini_mart_app/features/cart/models/cart_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CartState {
  final List<CartItemModel> items;

  CartState({required this.items});

  CartState copyWith({List<CartItemModel>? items}) {
    return CartState(
      items: items ?? this.items,
    );
  }
  

  double get totalPrice => items.fold(
        0,
        (total, item) => total + item.price * item.quantity,
      );
}



class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState(items: []));

  void addToCart(CartItemModel item) {
    final index = state.items.indexWhere((i) => i.id == item.id);
    if (index >= 0) {
      // Item already in cart; increase quantity
      final updatedItem = state.items[index].copyWith(
        quantity: state.items[index].quantity + 1,
      );
      final updatedItems = [...state.items]..[index] = updatedItem;
      state = state.copyWith(items: updatedItems);
    } else {
      // Add new item
      state = state.copyWith(items: [...state.items, item]);
    }
  }

  void removeFromCart(String id) {
    final updatedItems = state.items.where((item) => item.id != id).toList();
    state = state.copyWith(items: updatedItems);
  }

  void increaseQuantity(String id) {
    final index = state.items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      final updatedItem =
          state.items[index].copyWith(quantity: state.items[index].quantity + 1);
      final updatedItems = [...state.items]..[index] = updatedItem;
      state = state.copyWith(items: updatedItems);
    }
  }

  void decreaseQuantity(String id) {
    final index = state.items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      final currentItem = state.items[index];
      if (currentItem.quantity > 1) {
        final updatedItem = currentItem.copyWith(quantity: currentItem.quantity - 1);
        final updatedItems = [...state.items]..[index] = updatedItem;
        state = state.copyWith(items: updatedItems);
      } else {
        // Remove item if quantity goes below 1
        removeFromCart(id);
      }
    }
  }

  void clearCart() {
    state = state.copyWith(items: []);
  }
}

final cartStateProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) => CartNotifier(),
);
