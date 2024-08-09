import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ pages/CartPage.dart';
import '../ pages/CheckoutPage.dart';
import '../ pages/LoginPage.dart';
import '../ pages/ProductListPage.dart';
import '../ pages/RegisterPage.dart';
import '../ pages/UserProfilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My E-Commerce App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/products': (context) => ProductListPage(),
        '/productDetails': (context) => ProductListPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/orderHistory': (context) => OrderHistoryPage(),
        '/profile': (context) => UserProfilePage(),
      },
    );
  }
}
