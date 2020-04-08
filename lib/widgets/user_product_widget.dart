import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/providers/products.dart';
import 'package:shopflutterapp/screens/add_product_screen.dart';

///****************************************************
///*** Created by Fady Fouad on 06-Apr-20 at 18:07.***
///****************************************************

class UserProduct extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const UserProduct({Key key, this.title, this.imageUrl, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: ListTile(
            title: Text('$title'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            trailing: Container(
              width: 120,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          AddProductScreen.routeName, arguments: id);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Confirm Delete'),
                              content: Text('Are You sure ?'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('YES'),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                    Provider.of<Products>(
                                        context, listen: false).removeProduct(
                                        id);
                                  },
                                ),
                                FlatButton(
                                  child: Text('NO'),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(color: Theme.of(context).accentColor),
      ],
    );
  }
}
