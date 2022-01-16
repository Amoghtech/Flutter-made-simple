import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_complete_guide/models/http_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expirydate;
  String _userId;

  bool get isauth {
    return this.token != null;
  }

  String get token {
    if (_expirydate != null &&
        _expirydate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> signup(String email, String password) async {
    print('Singup');
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA_g5boZbVS353iCkSCfMWr-8OXwO6QVOQ');
    try {
      var res = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      final response = json.decode(res.body);

      if (response['error'] != null) {
        throw HttpException(response['error']['message']);
      }
      _token = response['idToken'];
      _userId = response['localId'];
      _expirydate = DateTime.now()
          .add(Duration(seconds: int.parse(response['expiresIn'])));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      print('login');
      final url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:verifyPassword?key=AIzaSyA_g5boZbVS353iCkSCfMWr-8OXwO6QVOQ');
      var res = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      final response = json.decode(res.body);
      print(response);
      _token = response['idToken'];
      _userId = response['localId'];
      _expirydate = DateTime.now()
          .add(Duration(seconds: int.parse(response['expiresIn'])));
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
