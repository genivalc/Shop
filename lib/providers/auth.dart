import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const url =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAMQnDj4Xog26Tdv9nvg3KVWdwD8T888GI";

  Future<void> signup(String email, String password) async {
    final response = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );
    print(json.decode(response.body));
    return Future.value();
  }
}
