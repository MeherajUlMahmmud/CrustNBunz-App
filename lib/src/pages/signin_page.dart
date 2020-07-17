import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/screens/main_screen.dart';
import 'package:foodapp/src/utils/firebase_repository.dart';
import 'package:foodapp/src/widgets/button.dart';
import 'package:foodapp/src/widgets/show-dialog.dart';
import 'package:scoped_model/scoped_model.dart';

import '../pages/signup_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
//  String _email, _password;

  final MainModel mainModel = MainModel();
  FirebaseRepository _repository = FirebaseRepository();
  bool isLoginPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              loginButton(),
              SizedBox(height: 15),
              isLoginPressed ? CircularProgressIndicator() : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () => performLogin(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void performLogin() {

    setState(() {
      isLoginPressed = true;
    });

    _repository.signIn().then((FirebaseUser user) {
      if (user != null) {
        authenticateUser(user);
      } else {}
    });
  }

  void authenticateUser(FirebaseUser user) {
    _repository.authenticateUser(user).then((isNewUser) {

      setState(() {
        isLoginPressed = false;
      });

      if (isNewUser) {
        _repository.addDataToDb(user).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return MainScreen(model: mainModel);
              }));
        });
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
              return MainScreen(model: mainModel);
            }));
      }
    });
  }


//  GlobalKey<FormState> _formKey = GlobalKey();
//
//  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      key: _scaffoldKey,
//      body: ListView(
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.symmetric(horizontal: 10.0),
//            child: Form(
//              key: _formKey,
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text(
//                    "Sign In",
//                    style: TextStyle(
//                      fontSize: 30.0,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                  SizedBox(height: 20.0),
//                  Card(
//                    elevation: 5.0,
//                    child: Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Column(children: <Widget>[
//                        _buildEmailTextFormField(),
//                        SizedBox(height: 25.0),
//                        _buildPasswordTextFormField(),
//                      ]),
//                    ),
//                  ),
//                  SizedBox(height: 5.0),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: <Widget>[
//                      Text(
//                        "Forgot Password?",
//                        style: TextStyle(
//                          color: Colors.red,
//                          fontSize: 16.0,
//                          decoration: TextDecoration.underline,
//                        ),
//                      ),
//                    ],
//                  ),
//                  SizedBox(height: 15.0),
//                  ScopedModelDescendant(builder:
//                      (BuildContext sctx, Widget child, MainModel model) {
//                    return GestureDetector(
//                      onTap: () {
//                        showLoadingIndicator(context, "Signing In...");
//                        onSubmit(model.authenticate);
//                      },
//                      child: Button(btnText: "Sign In"),
//                    );
//                  }),
////                  Divider(height: 25.0),
////                  Row(
////                    mainAxisAlignment: MainAxisAlignment.center,
////                    children: <Widget>[
////                      Text(
////                        "Don't have an account?",
////                        style: TextStyle(
////                          color: Colors.grey,
////                          fontSize: 16.0,
////                          fontWeight: FontWeight.bold,
////                        ),
////                      ),
////                      SizedBox(width: 5.0),
////                      GestureDetector(
////                        onTap: () {
////                          Navigator.of(context).pushReplacement(
////                              MaterialPageRoute(
////                                  builder: (BuildContext context) =>
////                                      SignUpPage()));
////                        },
////                        child: Text(
////                          "Sign Up",
////                          style: TextStyle(
////                            fontSize: 16.0,
////                            fontWeight: FontWeight.bold,
////                            color: Theme.of(context).primaryColor,
////                          ),
////                        ),
////                      )
////                    ],
////                  ),
//                ],
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  void onSubmit(Function authenticate) {
//    if (_formKey.currentState.validate()) {
//      _formKey.currentState.save();
//
//      print("The email: $_email, the password: $_password");
//      authenticate(_email, _password).then((final response) {
//        Navigator.of(context).pop();
//        if (!response['hasError']) {
//          Navigator.of(context).pushReplacementNamed("/mainScreen");
//        } else {
//          _scaffoldKey.currentState.showSnackBar(
//            SnackBar(
//              duration: Duration(seconds: 2),
//              backgroundColor: Colors.red,
//              content: Text(response['msg']),
//            )
//          );
//        }
//      });
//    }
//  }
//
//  Widget _buildEmailTextFormField() {
//    return TextFormField(
//      decoration: InputDecoration(
//        prefixIcon: Icon(Feather.mail),
//        labelText: "Email Address",
//        border: new OutlineInputBorder(
//          borderRadius: new BorderRadius.circular(25.0),
//        ),
//      ),
//      onSaved: (String email) {
//        _email = email;
//      },
//      validator: (String email) {
//        String errorMessage;
//        if (!email.contains("@")) {
//          errorMessage = "Your email is incorrect";
//        }
//        if (email.isEmpty) {
//          errorMessage = "Your email field is required";
//        }
//
//        return errorMessage;
//      },
//      keyboardType: TextInputType.emailAddress,
//    );
//  }
//
//  bool _toggleVisibility = false;
//
//  Widget _buildPasswordTextFormField() {
//    return TextFormField(
//      decoration: InputDecoration(
//        prefixIcon: Icon(Feather.lock),
//        labelText: "Password",
//        suffixIcon: IconButton(
//          onPressed: () {
//            setState(() {
//              _toggleVisibility = !_toggleVisibility;
//            });
//          },
//          icon:
//              Icon(_toggleVisibility ? Icons.visibility_off : Icons.visibility),
//        ),
//        border: new OutlineInputBorder(
//          borderRadius: new BorderRadius.circular(25.0),
//        ),
//      ),
//      validator: (String password) {
//        if (password.length == 0) {
//          return "Password cannot be empty";
//        } else {
//          return null;
//        }
//      },
//      obscureText: _toggleVisibility,
//      onSaved: (String password) {
//        _password = password;
//      },
//    );
//  }
}
