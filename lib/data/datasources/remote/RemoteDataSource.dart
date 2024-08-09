import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://your-mock-api.com/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<dynamic> fetchProducts() async {
    final response = await _dio.get('/products');
    return response.data;
  }

  Future<dynamic> fetchProductDetails(int productId) async {
    final response = await _dio.get('/products/$productId');
    return response.data;
  }

  Future<dynamic> addToCart(int productId, int quantity) async {
    final response = await _dio.post('/cart', data: {
      'productId': productId,
      'quantity': quantity,
    });
    return response.data;
  }

  Future<dynamic> updateCart(int cartItemId, int quantity) async {
    final response = await _dio.put('/cart/$cartItemId', data: {
      'quantity': quantity,
    });
    return response.data;
  }

  Future<dynamic> removeFromCart(int cartItemId) async {
    final response = await _dio.delete('/cart/$cartItemId');
    return response.data;
  }

  Future<dynamic> placeOrder(Map<String, dynamic> orderData) async {
    final response = await _dio.post('/orders', data: orderData);
    return response.data;
  }
}