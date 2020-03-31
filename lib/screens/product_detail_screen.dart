import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 29-Mar-20 at 16:01.***
///****************************************************

class ProductDetailsScreen extends StatelessWidget {
  final String name;

  static const routeName = 'ProductDetails';

  const ProductDetailsScreen({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments as String ;
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(),
    );
  }
}
