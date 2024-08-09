// product_repository.dart (located in 'lib/domain/repositories/')
import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductDetails(int productId);
  Future<void> addToCart(int productId, int quantity);
  Future<void> updateCart(int cartItemId, int quantity);
  Future<void> removeFromCart(int cartItemId);
  Future<void> placeOrder(Map<String, dynamic> orderData);
}
