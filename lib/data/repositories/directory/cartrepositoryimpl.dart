
import '../../models/cartitem.dart';
import 'cartrepository.dart';

class CartRepositoryImpl implements CartRepository {
  // Mocking a database or API interaction
  final List<CartItem> _cartItems = [];

  @override
  Future<void> addCartItem(CartItem cartItem) async {
    // Logic to add a new cart item to the list
    _cartItems.add(cartItem);
  }

  @override
  Future<void> updateCartItem(CartItem cartItem) async {
    // Logic to update the cart item in the list
    int index = _cartItems.indexWhere((item) => item.id == cartItem.id);
    if (index != -1) {
      _cartItems[index] = cartItem;
    }
  }

  @override
  Future<void> removeCartItem(CartItem cartItem) async {
    // Logic to remove the cart item from the list
    _cartItems.removeWhere((item) => item.id == cartItem.id);
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    // Returning all cart items
    return _cartItems;
  }

  @override
  Future<void> clearCart() async {
    // Logic to clear all cart items
    _cartItems.clear();
  }
  @override
  Future<CartItem?> getCartItemById(int id) async {
    try {
      return _cartItems.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }


}
