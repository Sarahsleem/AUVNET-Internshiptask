import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:auvnet_ecommerce/presentation/routes/routes.dart';
import 'package:auvnet_ecommerce/presentation/blocs/product/product_bloc.dart';
import 'package:auvnet_ecommerce/presentation/blocs/cart/cart_bloc.dart';
import 'package:auvnet_ecommerce/data/repositories/product_repository_impl.dart';
import 'package:auvnet_ecommerce/data/repositories/user_repository_impl.dart';
import 'package:auvnet_ecommerce/data/datasources/remote/remote_data_source.dart';
import 'package:auvnet_ecommerce/data/datasources/local/local_data_source.dart';
import 'package:auvnet_ecommerce/domain/usecases/get_products.dart';
import 'package:auvnet_ecommerce/domain/usecases/get_product_details.dart';
import 'package:auvnet_ecommerce/domain/usecases/add_to_cart.dart';
import 'package:auvnet_ecommerce/domain/usecases/update_cart.dart';
import 'package:auvnet_ecommerce/domain/usecases/remove_from_cart.dart';
import 'package:auvnet_ecommerce/domain/usecases/place_order.dart';
import 'package:auvnet_ecommerce/domain/repositories/product_repository.dart';
import 'package:auvnet_ecommerce/domain/repositories/user_repository.dart';

void main() async {
  // Initialize Hive for local storage
  await Hive.initFlutter();
  await Hive.openBox('userBox');

  // Instantiate data sources
  final remoteDataSource = RemoteDataSource();
  final localDataSource = LocalDataSource();

  // Instantiate repositories
  final productRepository = ProductRepositoryImpl(remoteDataSource);
  final userRepository = UserRepositoryImpl(localDataSource);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductRepository>(
          create: (_) => productRepository,
        ),
        RepositoryProvider<UserRepository>(
          create: (_) => userRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(
              GetProducts(context.read<ProductRepository>()),
              GetProductDetails(context.read<ProductRepository>()),
            ),
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc(
              AddToCart(context.read<ProductRepository>()),
              UpdateCart(context.read<ProductRepository>()),
              RemoveFromCart(context.read<ProductRepository>()),
              PlaceOrder(context.read<ProductRepository>()),
            ),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AUVNET E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
