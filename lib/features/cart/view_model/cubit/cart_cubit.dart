import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart/model/cart_item_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<List<CartItemModel>> {
  CartCubit() : super([]);

  void addToCart(CartItemModel item) {
    final existingIndex = state.indexWhere((e) => e.id == item.id);

    if (existingIndex != -1) {
      final updatedItem = state[existingIndex].copyWith(
        quantity: state[existingIndex].quantity + 1,
      );

      final updatedCart = List<CartItemModel>.from(state);
      updatedCart[existingIndex] = updatedItem;

      emit(updatedCart);
    } else {
      emit([...state, item]);
    }
  }

  void removeFromCart(String id) {
    final updatedCart = state.where((item) => item.id != id).toList();
    emit(updatedCart);
  }

  void increaseQuantity(String id) {
    final index = state.indexWhere((e) => e.id == id);
    if (index != -1) {
      final updatedItem = state[index].copyWith(
        quantity: state[index].quantity + 1,
      );

      final updatedCart = List<CartItemModel>.from(state);
      updatedCart[index] = updatedItem;

      emit(updatedCart);
    }
  }

  void decreaseQuantity(String id) {
    final index = state.indexWhere((e) => e.id == id);
    if (index != -1) {
      final currentItem = state[index];
      if (currentItem.quantity > 1) {
        final updatedItem = currentItem.copyWith(
          quantity: currentItem.quantity - 1,
        );

        final updatedCart = List<CartItemModel>.from(state);
        updatedCart[index] = updatedItem;

        emit(updatedCart);
      } else {
        removeFromCart(id);
      }
    }
  }
}
