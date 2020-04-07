import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 06-Apr-20 at 23:42.****
///****************************************************

class AddProductScreen extends StatefulWidget {
  static const routeName = 'AddProductScreen';

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _PriceFocusNode = FocusNode();
  final _DescFocusNode = FocusNode();
  final _imgUrlController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _DescFocusNode.dispose();
    _PriceFocusNode.dispose();
    _imgUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_PriceFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _PriceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_DescFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  keyboardType: TextInputType.multiline,
                  focusNode: _DescFocusNode,
                  maxLines: 3,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 120,
                      width: 120,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.amber)),
                      child: Container(
                        child: _imgUrlController.text.isEmpty
                            ? Text('No image Found')
                            : FittedBox(
                                child: Image.network(
                                  _imgUrlController.text,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image URL'),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.url,
                        controller: _imgUrlController,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
