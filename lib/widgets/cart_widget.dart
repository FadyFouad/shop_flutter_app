import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/providers/cart.dart';

///****************************************************
///*** Created by Fady Fouad on 04-Apr-20 at 01:25.***
///****************************************************

class CartWidget extends StatelessWidget {
  final String id;
  final String productID;
  final String name;
  final double price;
  final int quantity;

  const CartWidget(
      {Key key, this.id, this.name, this.price, this.quantity, this.productID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      child: Dismissible(
        key: ValueKey(productID),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          if (quantity > 1) {
            cart.deleteItem(productID);
            cart.addToCart(
                id: id, title: name, price: price, quantity: quantity - 1);
            print('quantity>1');
          } else {
            cart.deleteItem(productID);
          }
        },
        background: Container(
          color: Theme.of(context).errorColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
              Text(
                " Delete",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),
            ],
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
                child: FittedBox(child: Text('\$ ${price.toStringAsFixed(2)}')),
              ),
              title: Text(name),
              subtitle:
              Text('Total ${(price * quantity).toStringAsFixed(2)} \$'),
              trailing: Text('Quantity = ${quantity}'),
            ),
          ),
        ),
      ),
    );
  }
}
