import '../../../domain/entities/product.dart';
import '../../../domain/repositories/productrepository.dart';
import '../../datasources/remote/RemoteDataSource.dart';


class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource _remoteDataSource;

  ProductRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    final productsData = await _remoteDataSource.fetchProducts();
    return (productsData as List)
        .map((productData) => Product.fromJson(productData))
        .toList();
  }

  @override
  Future<Product> getProductDetails(int productId) async {
    final productData = await _remoteDataSource.fetchProductDetails(productId);
    return Product.fromJson(productData);
  }

  @override
  Future<void> addToCart(int productId, int quantity) async {
    await _remoteDataSource.addToCart(productId, quantity);
  }

  @override
  Future<void> updateCart(int cartItemId, int quantity) async {
    await _remoteDataSource.updateCart(cartItemId, quantity);
  }

  @override
  Future<void> removeFromCart(int cartItemId) async {
    await _remoteDataSource.removeFromCart(cartItemId);
  }

  @override
  Future<void> placeOrder(Map<String, dynamic> orderData) async {
    await _remoteDataSource.placeOrder(orderData);
  }
}
