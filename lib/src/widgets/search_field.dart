import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          hintText: "Search",
          suffixIcon: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            child: IconButton(
              icon: Icon(
                Feather.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
