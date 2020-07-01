import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/global.dart';

class CategoryCard extends StatelessWidget {
  final String id;
  final String categoryName;
  final String imagePath;
  final int numberOfItems;

  CategoryCard(
      {this.id, this.categoryName, this.imagePath, this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5.0),
        height: 70.0,
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage(imagePath),
              height: 65.0,
              width: 75.0,
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  categoryName,
                  style: cardTextStyle,
                ),
                Text(
                  "$numberOfItems Kinds",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
