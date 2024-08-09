import '../../../domain/entities/order.dart';

abstract class OrderRepository {
  Future<void> placeOrder(Order order);
  Future<List<Order>> getOrderHistory();
}

class OrderRepositoryImpl implements OrderRepository {
  final List<Order> _orders = [];

  @override
  Future<void> placeOrder(Order order) async {
    // Logic to place the order (e.g., save it to a database)
    _orders.add(order);
  }

  @override
  Future<List<Order>> getOrderHistory() async {
    // Logic to retrieve the order history
    return _orders;
  }
}
