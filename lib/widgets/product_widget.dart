import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/models/product.dart';
import 'package:shopflutterapp/providers/cart.dart';
import 'package:shopflutterapp/screens/product_detail_screen.dart';

///****************************************************
///*** Created by Fady Fouad on 29-Mar-20 at 03:04.***
///****************************************************

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: GridTile(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailsScreen.routeName,
                arguments: product.id,
              );
            },
            child: Hero(
              tag: product.id,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          footer: GridTileBar(
            leading: IconButton(
              icon: Icon(
                product.isFav ? Icons.favorite : Icons.favorite_border,
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
              onPressed: () {
                cart.addToCart(
                    id: product.id, title: product.name, price: product.price);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('One Item Added'),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () => cart.deleteSingleItem(product.id),
                  ),
                ));
              },
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
