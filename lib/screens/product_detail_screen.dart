import 'package:flutter/cupertino.dart';
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
    final products = Provider.of<Products>(context);
    final selectedProduct = products.getProduct(id);
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Products();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedProduct.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 256.0,
                width: double.infinity,
                margin: EdgeInsets.only(
                    bottom: 16.0, left: 16.0, right: 16.0, top: 4),
                child: Hero(
                  tag: selectedProduct.id,
                  child: Image.network(
                    selectedProduct.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '${selectedProduct.price} \$',
                style: TextStyle(color: Colors.grey, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text(
                selectedProduct.description,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
