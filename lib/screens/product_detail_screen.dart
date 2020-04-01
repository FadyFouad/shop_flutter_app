import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/providers/products.dart';

///****************************************************
///*** Created by Fady Fouad on 29-Mar-20 at 16:01.***
///****************************************************

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = 'ProductDetails';

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments as String;
    final products = Provider.of<Products>(context, listen: false);
    final selectedProduct = products.getProduct(id);
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Products();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedProduct.name),
        ),
        body: Container(),
      ),
    );
  }
}
