import 'package:flutter/material.dart';
import 'package:foodapp/src/pages/signin_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: <Widget>[
                      _buildUsernameTextFormField(),
                      SizedBox(height: 20.0),
                      _buildEmailTextFormField(),
                      SizedBox(height: 20.0),
                      _buildPasswordTextFormField(),
                      SizedBox(height: 20.0),
                      _buildConfirmPasswordTextFormField(),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.blueAccent,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 25.0,
                ),
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
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => SignInPage()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline),
        labelText: "Username",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Username cannot be empty";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.text,
    );
  }

  Widget _buildEmailTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: "Email Address",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Email cannot be empty";
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
        prefixIcon: Icon(Icons.vpn_key),
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

  Widget _buildConfirmPasswordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
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
