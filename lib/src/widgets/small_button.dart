import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String btnText;

  SmallButton({this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
//      height: 30.0,
      width: 70.0,
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0)),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme
                .of(context)
                .accentColor,
          ),
        ),
      ),
    );
  }
}
