//import 'dart:convert';
//import 'package:foodapp/src/enums/auth_mode.dart';
//import 'package:foodapp/src/models/user_model.dart';
//import 'package:http/http.dart' as http;
//import 'package:scoped_model/scoped_model.dart';
//
//class UserModel extends Model {
//  User _authenticatedUser;
//  bool _isLoading;
//
//  User get authenticatedUser {
//    return _authenticatedUser;
//  }
//
//  bool get isLoading {
//    return _isLoading;
//  }
//
//  Future<Map<String, dynamic>> authenticate(String email, String password,
//      {AuthMode authMode = AuthMode.SignIn}) async {
//    _isLoading = true;
//    notifyListeners();
//
//    Map<String, dynamic> authData = {
//      "email": email,
//      "password": password,
//      "returnSecureToken": true,
//    };
//
//    String msg;
//    bool hasError = false;
//
//    try {
//      http.Response response;
//
//      if (authMode == AuthMode.SignUp) {
//        response = await http.post(
//          "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDYj8wrPAiVL1tf8J7cIAaeVCAyD23zJDY",
//          body: json.encode(authData),
//          headers: {'Content-Type': 'application/json'},
//        );
//      } else if (authMode == AuthMode.SignIn) {
//        response = await http.post(
//          "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDYj8wrPAiVL1tf8J7cIAaeVCAyD23zJDY",
//          body: json.encode(authData),
//          headers: {'Content-Type': 'application/json'},
//        );
//      }
//
//      Map<String, dynamic> responseBody = json.decode(response.body);
//
//      if (responseBody.containsKey('idToken')) {
//        _authenticatedUser = User(
//          id: responseBody["localId"],
//          token: responseBody["idToken"],
//          email: responseBody["email"],
//        );
//        if (authMode == AuthMode.SignUp) {
//          msg = "Sign Up Successful.";
//        } else if (authMode == AuthMode.SignIn) {
//          msg = "Sign In Successful.";
//        }
//      } else {
//        hasError = true;
//        if (responseBody['error']['message'] == "EMAIL_EXISTS") {
//          msg = "This email is already registered.";
//        } else if (responseBody['error']['message'] == "EMAIL_NOT_FOUND") {
//          msg = "This email is not registered.";
//        } else if (responseBody['error']['message'] == "INVALID_PASSWORD") {
//          msg = "The password is invalid.";
//        }
//      }
//
//      _isLoading = false;
//      notifyListeners();
//
//      return {
//        'msg': msg,
//        'hasError': hasError,
//      };
//    } catch (error) {
//      _isLoading = false;
//      notifyListeners();
//      print("The error singing up: $error");
//
//      return {
//        'msg': "Failed operation",
//        'hasError': !hasError,
//      };
//    }
//  }
//}
