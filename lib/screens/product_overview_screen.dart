import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/providers/cart.dart';
import 'package:shopflutterapp/providers/products.dart';
import 'package:shopflutterapp/screens/cart_screen.dart';
import 'package:shopflutterapp/widgets/badge.dart';
import 'package:shopflutterapp/widgets/main_drawer.dart';
import 'package:shopflutterapp/widgets/product_widget.dart';

///****************************************************
///*** Created by Fady Fouad on 26-Mar-20 at 17:03.***
///****************************************************

class ProductOverViewScreen extends StatefulWidget {
  final String title;

  ProductOverViewScreen({Key key, this.title}) : super(key: key);

  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = false;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      setState(() {
        _isLoading = true;
      });
      print('_isLoading = $_isLoading');
      Provider.of<Products>(context).fetchProduct();
      print('Provider.of<Products>(context).fetchProduct()');
      setState(() {
        _isLoading = false;
      });
      print('_isLoading = $_isLoading');
    }
    _isInit = true;
    print('--------------------------------------------------');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (BuildContext context, Cart cart, Widget iconButton) {
              String count = cart.getItemCount.toString();
              return Badge(
                child: iconButton,
                value: count,
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Container(
        child: ProductGridView(
          isFav: _showOnlyFavorites,
        ),
      ),
    );
  }
}

class ProductGridView extends StatelessWidget {
  final bool isFav;

  const ProductGridView({Key key, this.isFav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    return FutureBuilder(
//      future: Provider.of<Products>(context, listen: false).fetchProduct(),
//      builder: (context, dataSnapshot) {
//        if (dataSnapshot.connectionState == ConnectionState.waiting) {
//          return Center(child: CircularProgressIndicator());
//        } else {
//          if (dataSnapshot.error != null) {
//            return Center(child: Text('An error occured!'));
//          } else {
    final productData = Provider.of<Products>(context);
    final products =
    isFav ? productData.favProductList : productData.productList;
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0),
      itemCount: products.length,
    );
  }
}
//      },
//    );
//  }
//}


/*
    final productData = Provider.of<Products>(context);
    final products =
        isFav ? productData.favProductList : productData.productList;
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0),
      itemCount: products.length,
    );
  }
}
*/
enum FilterOptions {
  Favorites,
  All,
}
