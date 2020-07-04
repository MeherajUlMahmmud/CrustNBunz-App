import 'package:flutter/material.dart';
import 'package:foodapp/src/widgets/small_button.dart';

class FoodItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String discount;

  FoodItemCard(this.title, this.description, this.price, this.discount);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 140.0,
//        color: Colors.red,
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(10.0),
//          boxShadow: [
//            BoxShadow(
//              offset: Offset(0, 0.5),
//              blurRadius: 5.0,
//              color: Colors.black38,
//            ),
//          ],
//        ),
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Card(
        elevation: 3.0,
        color: Colors.lightGreen[50],
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              height: size.width * 0.25,
              width: size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/breakfast.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
//                color: Colors.yellow,
              width: size.width * 0.55,
              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$title",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("$description"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            price == discount
                                ? "\u09F3 $price "
                                : "\u09F3 $discount ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            price == discount ? "" : "\u09F3 $price",
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      SmallButton(btnText: "Bag it"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
