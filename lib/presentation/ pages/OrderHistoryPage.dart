import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/orderbloc.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order History')),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is OrdersLoaded) {
            return ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                final order = state.orders[index];
                return ListTile(
                  title: Text('Order #${order.id}'),
                  subtitle: Text('Total: \$${order.totalAmount}'),
                );
              },
            );
          } else if (state is OrderError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No Orders Found'));
          }
        },
      ),
    );
  }
}
