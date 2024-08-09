
import '../../models/cartitem.dart';

abstract class CartRepository {
  Future<void> addCartItem(CartItem cartItem);
  Future<void> updateCartItem(CartItem cartItem);
  Future<void> removeCartItem(CartItem cartItem);
  Future<List<CartItem>> getCartItems();
  Future<void> clearCart();
  Future<CartItem?> getCartItemById(int id); // Changed method to use 'id'
}
