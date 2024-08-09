
import '../../data/models/cartitem.dart';

import '../../data/repositories/directory/cartrepository.dart';
import '../../data/repositories/directory/orderrepository.dart';

import '../entities/order.dart';

class PlaceOrder {
  final CartRepository _cartRepository;
  final OrderRepository _orderRepository;

  PlaceOrder(this._cartRepository, this._orderRepository);

  Future<void> execute() async {
    // Get all the items in the cart
    List<CartItem> cartItems = await _cartRepository.getCartItems();

    // Create a new order from the cart items
    Order order = Order.fromCartItems(cartItems);

    // Place the order
    await _orderRepository.placeOrder(order);

    // Clear the cart
    await _cartRepository.clearCart();
  }
}
