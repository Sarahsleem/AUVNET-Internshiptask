import '../../data/models/cartitem.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final String productId;
  final int quantity;

  AddToCartEvent({
    required this.productId,
    required this.quantity,
  });
}

class UpdateCartEvent extends CartEvent {
  final CartItem cartItem;

  UpdateCartEvent({
    required this.cartItem,
  });
}

class RemoveFromCartEvent extends CartEvent {
  final CartItem cartItem;

  RemoveFromCartEvent({
    required this.cartItem,
  });
}

class PlaceOrderEvent extends CartEvent {}