import '../../data/models/cartitem.dart';
import '../../data/repositories/directory/cartrepository.dart';


class RemoveFromCart {
  final CartRepository _cartRepository;

  RemoveFromCart(this._cartRepository);

  Future<void> execute(CartItem cartItem) async {
    await _cartRepository.removeCartItem(cartItem);
  }
}