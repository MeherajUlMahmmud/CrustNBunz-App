import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnText;


  Button({this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).accentColor,
        child: Center(
          child: Text(
            "$btnText",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),);
  }
}
