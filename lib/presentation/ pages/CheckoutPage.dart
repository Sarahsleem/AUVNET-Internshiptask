import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/CartBloc.dart';


class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CartUpdated) {
            final cartItems = state.cartItems;
            double total = cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total: \$${total.toStringAsFixed(2)}', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CartBloc>().add(PlaceOrder());
                      Navigator.pushNamed(context, '/orderHistory');
                    },
                    child: Text('Place Order'),
                  ),
                ],
              ),
            );
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Nothing to checkout.'));
          }
        },
      ),
    );
  }
}
