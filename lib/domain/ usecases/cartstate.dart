abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartUpdated extends CartState {}

class OrderPlaced extends CartState {}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}