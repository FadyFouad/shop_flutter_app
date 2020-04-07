import 'package:flutter/material.dart';
import 'package:shopflutterapp/screens/add_product_screen.dart';

///****************************************************
///*** Created by Fady Fouad on 06-Apr-20 at 18:07.***
///****************************************************

class UserProduct extends StatelessWidget {
  final String title;
  final String imageUrl;

  const UserProduct({Key key, this.title, this.imageUrl}) : super(key: key);

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
                      Navigator.of(context)
                          .pushNamed(AddProductScreen.routeName);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () {},
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
