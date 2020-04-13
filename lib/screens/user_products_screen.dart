import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/providers/products.dart';
import 'package:shopflutterapp/widgets/main_drawer.dart';
import 'package:shopflutterapp/widgets/user_product_widget.dart';

import 'add_product_screen.dart';

///****************************************************
///*** Created by Fady Fouad on 06-Apr-20 at 17:50.***
///****************************************************

class UserProductsScreen extends StatelessWidget {
  static const routeName = 'UserProductsScreen';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              child: UserProduct(
                id: products.productList[index].id,
                title: products.productList[index].title,
                imageUrl: products.productList[index].imageUrl,
              ),
            );
          },
          itemCount: products.productList.length,
        ),
      ),
    );
  }
}
