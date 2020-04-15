import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:shopflutterapp/models/http_exception.dart';

///****************************************************
///*** Created by Fady Fouad on 13-Apr-20 at 23:55.***
///****************************************************

class Authentication with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  static const API_KEY = 'AIzaSyAQ6wgW6PCdM44Z_UbhCyX546lZDI4ZJMw';

  bool get isAuthenticated {
    print(
        'isAuthenticated : _token = ${_token != null
            ? 'Not Null'
            : 'Null'} _expiryDate = $_expiryDate _userId = $_userId');
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate({String eMail, String passWord, url}) async {
    try {
      final response = await Http.post(
        url,
        body: json.encode({
          'email': eMail,
          'password': passWord,
          'returnSecureToken': true,
        }),
      );
      final result = json.decode(response.body);
      if (result['error'] != null) {
        throw HttpException(result['error']['message']);
      }
      _token = result['idToken'];
      _userId = result['localId'];
      _expiryDate =
          DateTime.now().add(Duration(seconds: int.parse(result['expiresIn'])));
      print(
          'signIn : _token = ${_token != null
              ? 'Not Null'
              : 'Null'} _expiryDate = $_expiryDate _userId = $_userId');
      notifyListeners();
    } catch (e, stack) {
      print(stack);
      throw (e);
    }
  }

  Future<void> signUp({String eMail, String passWord}) async {
    const url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=$API_KEY';
    return _authenticate(eMail: eMail, passWord: passWord, url: url);
  }

  Future<void> signIn({String eMail, String passWord}) async {
    const url =
//        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$API_KEY';
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=$API_KEY';
    return _authenticate(eMail: eMail, passWord: passWord, url: url);
  }
}
