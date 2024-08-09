import '../../data/repositories/directory/orderrepository.dart';
import '../entities/order.dart';


class GetOrders {
  final OrderRepository _orderRepository;

  GetOrders(this._orderRepository);

  Future<List<Order>> execute() async {
    try {
      // Fetch orders from the repository
      final orders = await _orderRepository.getOrders();
      return orders;
    } catch (e) {
      // Handle any errors that occur during fetching
      throw Exception('Failed to fetch orders: $e');
    }
  }
}
