import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopflutterapp/providers/orders.dart';

///****************************************************
///*** Created by Fady Fouad on 04-Apr-20 at 19:51.***
///****************************************************

class OrderWidget extends StatefulWidget {
  final Order order;

  const OrderWidget({Key key, this.order}) : super(key: key);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('${widget.order.amount} \$'),
              subtitle:
              Text(DateFormat('dd-MM hh:mm').format(widget.order.date)),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            if (_expanded)
              Container(
                padding: EdgeInsets.all(8.0),
                height: min(widget.order.products.length * 28.0 + 32.0, 160),
                child: ListView(
                  children: widget.order.products
                      .map(
                        (e) =>
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '${e.title}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '${e.quantity}X  ${e.price}\$',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                  )
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget toggleDetails() {
    if (_expanded) {
      return Container(
        height: min(widget.order.products.length * 8.0 + 100.0, 160),
        child: ListView(
          children: widget.order.products
              .map(
                (e) =>
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${e.title}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '${e.quantity}X ${e.price} \$',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
          )
              .toList(),
        ),
      );
    }
  }
}
