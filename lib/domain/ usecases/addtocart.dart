import '../../data/models/cartitem.dart';
import '../../data/repositories/directory/cartrepository.dart';

class AddToCart {
  final CartRepository _cartRepository;

  AddToCart(this._cartRepository);

  Future<void> execute(String productId, int quantity) async {
    // Check if the product is already in the cart
    CartItem? existingCartItem = await _cartRepository.getCartItemByProductId(productId);

    if (existingCartItem != null) {
      // Update the existing cart item
      existingCartItem.quantity += quantity;
      await _cartRepository.updateCartItem(existingCartItem);
    } else {
      // Add a new cart item
      CartItem newCartItem = CartItem(productId: productId, quantity: quantity, id: , name: '');
      await _cartRepository.addCartItem(newCartItem);
    }
  }
}