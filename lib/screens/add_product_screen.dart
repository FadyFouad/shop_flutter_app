import 'package:flutter/material.dart';
import 'package:shopflutterapp/models/product.dart';

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
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();
  Product _addedProduct = Product(
      id: null,
      name: null,
      price: null,
      imageUrl: null,
      description: null);

  @override
  void dispose() {
    // TODO: implement dispose
    _DescFocusNode.dispose();
    _PriceFocusNode.dispose();
    _imageUrlFocus.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _imageUrlFocus.addListener(_updateImageUrl);
    super.initState();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocus.hasFocus) {
      setState(() {});
    }
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
            key: _formGlobalKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_PriceFocusNode);
                  },
                  onSaved: (title) =>
                  _addedProduct = Product(
                      id: DateTime.now().toString(),
                      name: title,
                      price: 0,
                      imageUrl: '',
                      description: ''),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _PriceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_DescFocusNode);
                  },
                  onSaved: (price) =>
                  _addedProduct = Product(
                      id: _addedProduct.id,
                      name: _addedProduct.name,
                      price: double.parse(price),
                      imageUrl: _addedProduct.imageUrl,
                      description: _addedProduct.description),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  keyboardType: TextInputType.multiline,
                  focusNode: _DescFocusNode,
                  maxLines: 3,
                  onSaved: (description) =>
                  _addedProduct = Product(
                      id: _addedProduct.id,
                      name: _addedProduct.name,
                      price: _addedProduct.price,
                      imageUrl: _addedProduct.imageUrl,
                      description: description),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 120,
                      width: 120,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.amber)),
                      child: _imageUrlController.text.isEmpty
                          ? Text('No image Found')
                          : FittedBox(
                        child: Image.network(
                          _imageUrlController.text,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image URL'),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.url,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocus,
                        onSaved: (url) =>
                        _addedProduct = Product(
                            id: _addedProduct.id,
                            name: _addedProduct.name,
                            price: _addedProduct.price,
                            imageUrl: url,
                            description: _addedProduct.description),
                      ),
                    ),
                  ],
                ),
                Divider(),
                FlatButton(
                  onPressed: () {
                    _saveProduct();
                  },
                  child: Text('Save'),
                  color: Theme
                      .of(context)
                      .accentColor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveProduct() {
    _formGlobalKey.currentState.save();
    print(_addedProduct.toString());
  }
}
