import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

///****************************************************
///*** Created by Fady Fouad on 13-Apr-20 at 23:55.***
///****************************************************

class Authentication with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  DateTime _userId;
  static const API_KEY = 'AIzaSyAQ6wgW6PCdM44Z_UbhCyX546lZDI4ZJMw';

  Future<void> signUp({String eMail, String passWord}) async {
    const url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=$API_KEY';
    final response = await Http.post(
      url,
      body: json.encode({
        'email': eMail,
        'password': passWord,
        'returnSecureToken': true,
      }),
    );
    print(json.decode(response.body));
  }

  Future<void> signIn({String eMail, String passWord}) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$API_KEY';
    final response = await Http.post(
      url,
      body: json.encode({
        'email': eMail,
        'password': passWord,
        'returnSecureToken': true,
      }),
    );
    print(json.decode(response.body));
  }
}
