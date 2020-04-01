import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/models/product.dart';
import 'package:shopflutterapp/screens/product_detail_screen.dart';

///****************************************************
///*** Created by Fady Fouad on 29-Mar-20 at 03:04.***
///****************************************************

class ProductItem extends StatelessWidget {
//  final String id;
//  final String name;
//  final String imageUrl;

//  const ProductItem({Key key, this.id, this.name, this.imageUrl})
//      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: GridTile(
          child: Container(
              child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailsScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          )),
          footer: GridTileBar(
            leading: IconButton(
              icon: Icon(
                product.isFav ? Icons.favorite_border : Icons.favorite,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                product.toggleFav();
              },
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.black54,
            title: Text(
              product.name,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
