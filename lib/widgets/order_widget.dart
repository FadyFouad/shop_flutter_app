import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopflutterapp/providers/orders.dart';

///****************************************************
///*** Created by Fady Fouad on 04-Apr-20 at 19:51.***
///****************************************************

class OrderWidget extends StatelessWidget {
  final Order order;

  const OrderWidget({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('${order.amount} \$'),
              subtitle: Text(DateFormat('dd-MM hh:mm').format(order.date)),
              trailing: IconButton(
                icon: Icon(Icons.expand_more),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
