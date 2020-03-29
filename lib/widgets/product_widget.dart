import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 29-Mar-20 at 03:04.***
///****************************************************

class ProductItem extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;

  const ProductItem({Key key, this.id, this.name, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridTile(
        child: Container(
            child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        )),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              Icons.favorite_border,
            ),
            onPressed: () {},
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.black54,
          title: Text(
            name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
