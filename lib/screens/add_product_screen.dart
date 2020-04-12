import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflutterapp/models/product.dart';
import 'package:shopflutterapp/providers/products.dart';

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

  var _isInit = true;
  var _isLoading = false;
  Product _addedProduct = Product(
      id: null,
      name: null,
      price: 0,
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

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final String id = ModalRoute
          .of(context)
          .settings
          .arguments as String;
      if (id != null) {
        _addedProduct =
            Provider.of<Products>(context, listen: false).getProduct(id);
        _imageUrlController.text = _addedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
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
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formGlobalKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  initialValue: _addedProduct.name,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_PriceFocusNode);
                  },
                  onSaved: (title) =>
                  _addedProduct = Product(
                      id: _addedProduct.id,
                      name: title,
                      price: 0,
                      imageUrl: '',
                      description: '',
                      isFav: _addedProduct.isFav),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter the Title';
                    } else
                      return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  initialValue: '${_addedProduct.price}',
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
                      description: _addedProduct.description,
                      isFav: _addedProduct.isFav),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter the Price';
                    } else if (double.tryParse(value) == null ||
                        double.parse(value) <= 0) {
                      return 'Please enter valid number';
                    } else
                      return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  initialValue: _addedProduct.description,
                  keyboardType: TextInputType.multiline,
                  focusNode: _DescFocusNode,
                  maxLines: 3,
                  onSaved: (description) =>
                  _addedProduct = Product(
                      id: _addedProduct.id,
                      name: _addedProduct.name,
                      price: _addedProduct.price,
                      imageUrl: _addedProduct.imageUrl,
                      description: description,
                      isFav: _addedProduct.isFav),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter the Description';
                    } else
                      return null;
                  },
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 120,
                      width: 120,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border:
                          Border.all(width: 1, color: Colors.amber)),
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
                        decoration:
                        InputDecoration(labelText: 'Image URL'),
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
                            description: _addedProduct.description,
                            isFav: _addedProduct.isFav),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter valid URL';
                          } else
                            return null;
                        },
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
    setState(() {
      _isLoading = true;
    });
    var products = Provider.of<Products>(context, listen: false);
    final isValid = _formGlobalKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formGlobalKey.currentState.save();
    if (_addedProduct.id != null) {
      products.editProduct(_addedProduct.id, _addedProduct);
    } else {
      _addedProduct = Product(
          id: DateTime.now().toString(),
          name: _addedProduct.name,
          description: _addedProduct.description,
          imageUrl: _addedProduct.imageUrl,
          price: _addedProduct.price,
          isFav: _addedProduct.isFav);
      products.addProduct(_addedProduct).then((value) {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pop();
      });
    }
    print(_addedProduct.toString());
  }
}
