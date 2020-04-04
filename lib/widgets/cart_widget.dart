import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 04-Apr-20 at 01:25.***
///****************************************************

class CartWidget extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  final int quantity;

  const CartWidget({Key key, this.id, this.name, this.price, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
        key: ValueKey(id),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {},
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(8.0),
        ),
        child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                child: FittedBox(child: Text('\$ ${price}')),
              ),
              title: Text(name),
              subtitle: Text('Total ${price * quantity} \$'),
              trailing: Text('Quantity = ${quantity}'),
            ),
          ),
        ),
      ),
    );
  }
}
