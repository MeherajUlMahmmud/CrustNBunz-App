import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/global.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;

  CategoryCard(this.categoryName);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 80.0,
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/burger.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              categoryName,
              style: cardTextStyle,
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_right,
                size: 30.0,
                color: Colors.lightGreen,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
