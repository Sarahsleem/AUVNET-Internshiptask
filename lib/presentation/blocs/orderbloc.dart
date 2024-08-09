import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/ usecases/getorder.dart';
import '../../domain/entities/order.dart';


// Order Events
abstract class OrderEvent {}

class FetchOrders extends OrderEvent {}

// Order States
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrdersLoaded extends OrderState {
  final List<Order> orders;

  OrdersLoaded(this.orders);
}

class OrderError extends OrderState {
  final String message;

  OrderError(this.message);
}

// Order Bloc
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetOrders _getOrders;

  OrderBloc(this._getOrders) : super(OrderInitial()) {
    on<FetchOrders>(_onFetchOrders);
  }

  Future<void> _onFetchOrders(
      FetchOrders event,
      Emitter<OrderState> emit,
      ) async {
    emit(OrderLoading());
    try {
      final orders = await _getOrders.execute();
      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
