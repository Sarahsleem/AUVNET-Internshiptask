import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/ usecases/addtocart.dart';
import '../../domain/ usecases/cartevent.dart';
import '../../domain/ usecases/cartstate.dart';
import '../../domain/ usecases/placeorder.dart';
import '../../domain/ usecases/removecart.dart';
import '../../domain/ usecases/updatecart.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCart _addToCart;
  final UpdateCart _updateCart;
  final RemoveFromCart _removeFromCart;
  final PlaceOrder _placeOrder;

  CartBloc({
    required AddToCart addToCart,
    required UpdateCart updateCart,
    required RemoveFromCart removeFromCart,
    required PlaceOrder placeOrder,
  })  : _addToCart = addToCart,
        _updateCart = updateCart,
        _removeFromCart = removeFromCart,
        _placeOrder = placeOrder,
        super(CartInitial());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddToCartEvent) {
      yield* _handleAddToCart(event);
    } else if (event is UpdateCartEvent) {
      yield* _handleUpdateCart(event);
    } else if (event is RemoveFromCartEvent) {
      yield* _handleRemoveFromCart(event);
    } else if (event is PlaceOrderEvent) {
      yield* _handlePlaceOrder();
    }
  }

  Stream<CartState> _handleAddToCart(AddToCartEvent event) async* {
    yield CartLoading();
    try {
      await _addToCart.execute(event.productId, event.quantity);
      yield CartUpdated();
    } catch (e) {
      yield CartError(e.toString());
    }
  }

  Stream<CartState> _handleUpdateCart(UpdateCartEvent event) async* {
    yield CartLoading();
    try {
      await _updateCart.execute(event.cartItem);
      yield CartUpdated();
    } catch (e) {
      yield CartError(e.toString());
    }
  }

  Stream<CartState> _handleRemoveFromCart(RemoveFromCartEvent event) async* {
    yield CartLoading();
    try {
      await _removeFromCart.execute(event.cartItem);
      yield CartUpdated();
    } catch (e) {
      yield CartError(e.toString());
    }
  }

  Stream<CartState> _handlePlaceOrder() async* {
    yield CartLoading();
    try {
      await _placeOrder.execute();
      yield OrderPlaced();
    } catch (e) {
      yield CartError(e.toString());
    }
  }
}