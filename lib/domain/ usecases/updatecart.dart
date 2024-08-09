import '../../data/models/cartitem.dart';
import '../../data/repositories/directory/cartrepository.dart';


class UpdateCart {
  final CartRepository _cartRepository;

  UpdateCart(this._cartRepository);

  Future<void> execute(CartItem cartItem) async {
    await _cartRepository.updateCartItem(cartItem);
  }
}