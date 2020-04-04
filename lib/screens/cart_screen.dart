import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/providers/cart.dart';
import 'package:shopflutterapp/widgets/cart_widget.dart';

///****************************************************
///*** Created by Fady Fouad on 04-Apr-20 at 00:43.***
///****************************************************

class CartScreen extends StatelessWidget {
  static const routeName = 'CartScreen';

  @override
  Widget build(BuildContext context) {
    final myCart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(width: 8.0),
                    Spacer(),
                    Chip(
                      label: Text(
                        '${myCart.getTotalMoney.toString()} \$',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                      child: Text('Order Now'),
                      textColor: Theme.of(context).accentColor,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => CartWidget(
                    id: myCart.cartItems.values.toList()[index].id,
                    productID: myCart.cartItems.keys.toList()[index],
                    price: myCart.cartItems.values.toList()[index].price,
                    quantity: myCart.cartItems.values.toList()[index].quantity,
                    name: myCart.cartItems.values.toList()[index].title),
                itemCount: myCart.getItemCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
