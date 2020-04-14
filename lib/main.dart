import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/providers/auth.dart';
import 'package:shopflutterapp/providers/cart.dart';
import 'package:shopflutterapp/providers/orders.dart';
import 'package:shopflutterapp/providers/products.dart';
import 'package:shopflutterapp/screens/add_product_screen.dart';
import 'package:shopflutterapp/screens/auth_screen.dart';
import 'package:shopflutterapp/screens/cart_screen.dart';
import 'package:shopflutterapp/screens/orders_screen.dart';
import 'package:shopflutterapp/screens/product_detail_screen.dart';
import 'package:shopflutterapp/screens/product_overview_screen.dart';
import 'package:shopflutterapp/screens/user_products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders()),
        ChangeNotifierProvider.value(value: Authentication()),
      ],
      child: Consumer<Authentication>(
        builder: (context, authentication, child) =>
            MaterialApp(
              title: 'Shop App',
              theme: ThemeData(
                primarySwatch: Colors.pink,
              ),
              home: ProductOverViewScreen(title: 'Shop Home Page'),
              initialRoute: 'main',
              routes: {
                'main': (_) =>
                authentication.isAuthenticated
                    ? ProductOverViewScreen(title: 'Shop')
                    : AuthScreen(),
                ProductOverViewScreen.routeName: (context) =>
                    ProductOverViewScreen(),
                ProductDetailsScreen.routeName: (context) =>
                    ProductDetailsScreen(),
                CartScreen.routeName: (context) => CartScreen(),
                OrderScreen.routeName: (context) => OrderScreen(),
                UserProductsScreen.routeName: (context) => UserProductsScreen(),
                AddProductScreen.routeName: (context) => AddProductScreen(),
              },
            ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text("Hello"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
