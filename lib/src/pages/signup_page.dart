import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodapp/src/enums/auth_mode.dart';
import 'package:foodapp/src/pages/signin_page.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/button.dart';
import 'package:foodapp/src/widgets/show-dialog.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email;
  String _username;
  String _password;

  // String _confirmPassword;

  GlobalKey<FormState> _formKey = GlobalKey();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 5.0),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: <Widget>[
//                        _buildUsernameTextFormField(),
//                        SizedBox(height: 20.0),
                        _buildEmailTextFormField(),
                        SizedBox(height: 20.0),
                        _buildPhoneNumberTextFormField(),
                        SizedBox(height: 20.0),
                        _buildPasswordTextFormField(),
                        SizedBox(height: 20.0),
                        _buildConfirmPasswordTextFormField(),
                      ]),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  ScopedModelDescendant(builder:
                      (BuildContext sctx, Widget child, MainModel model) {
                    return GestureDetector(
                      onTap: () {
                        showLoadingIndicator(context, "Signing Up...");
//                        onSubmit(model.authenticate);
                      },
                      child: Button(btnText: "Sign Up"),
                    );
                  }),
                  Divider(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignInPage()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onSubmit(Function authenticate) {
//    if (_formKey.currentState.validate()) {
//      _formKey.currentState.save();
//
//      print("The email: $_email, the password: $_password");
//      authenticate(_email, _password, authMode: AuthMode.SignUp).then((final response) {
//        Navigator.of(context).pop();
//        if (!response['hasError']) {
//          Navigator.of(context).pushReplacementNamed("/mainScreen");
//        } else {
//          _scaffoldKey.currentState.showSnackBar(
//              SnackBar(
//                duration: Duration(seconds: 2),
//                backgroundColor: Colors.red,
//                content: Text(response['msg']),
//              )
//          );
//        }
//      });
//    }
  }

//  Widget _buildUsernameTextFormField() {
//    return TextFormField(
//      decoration: InputDecoration(
//        prefixIcon: Icon(Icons.person_outline),
//        labelText: "Username",
//        border: new OutlineInputBorder(
//          borderRadius: new BorderRadius.circular(25.0),
//        ),
//      ),
//      onSaved: (String username) {
//        _username = username.trim();
//      },
//      validator: (String username) {
//        String errorMessage;
//        if (username.isEmpty) {
//          errorMessage =  "Username cannot be empty";
//        }
//          return errorMessage;
//      },
//      keyboardType: TextInputType.text,
//    );
//  }

  Widget _buildEmailTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Feather.mail),
        labelText: "Email Address",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String email) {
        _email = email;
      },
      validator: (String email) {
        String errorMessage;
        if (!email.contains("@")) {
          errorMessage = "Your email is incorrect";
        }
        if (email.isEmpty) {
          errorMessage = "Your email field is required";
        }

        return errorMessage;
      },
    );
  }

  Widget _buildPhoneNumberTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Feather.phone),
        labelText: "Phone Number",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Phone Number cannot be empty";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
    );
  }

  bool _toggleVisibility = false;

  Widget _buildPasswordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Feather.lock),
        labelText: "Password",
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon:
          Icon(_toggleVisibility ? Icons.visibility_off : Icons.visibility),
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
      ),
      validator: (String password) {
        if (password.length == 0) {
          return "Password cannot be empty";
        } else {
          return null;
        }
      },
      obscureText: _toggleVisibility,
      onSaved: (String password) {
        _password = password;
      },
    );
  }

  Widget _buildConfirmPasswordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Feather.lock),
        labelText: "Confirm Password",
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon:
          Icon(_toggleVisibility ? Icons.visibility_off : Icons.visibility),
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Password cannot be empty";
        } else {
          return null;
        }
      },
      obscureText: _toggleVisibility,
    );
  }
}
