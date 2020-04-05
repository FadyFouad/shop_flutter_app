import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/providers/orders.dart';
import 'package:shopflutterapp/widgets/main_drawer.dart';
import 'package:shopflutterapp/widgets/order_widget.dart';

///****************************************************
///*** Created by Fady Fouad on 04-Apr-20 at 19:46.***
///****************************************************

class OrderScreen extends StatelessWidget {
  static const routeName = 'OrderScreen';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Finish Orders'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return OrderWidget(
              order: orders.orders[index],
            );
          },
          itemCount: orders.orders.length,
        ),
      ),
    );
  }
}
