import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BoughtFoods extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double ratings;

  BoughtFoods({
    this.id,
    this.name,
    this.imagePath,
    this.category,
    this.price,
    this.discount,
    this.ratings,
  });

  @override
  _BoughtFoodsState createState() => _BoughtFoodsState();
}

class _BoughtFoodsState extends State<BoughtFoods> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 220.0,
            width: width,
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40.0,
                width: 90.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor.withOpacity(0.7),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Feather.shopping_cart,
//                    size: 30.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Bag it",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
//                      fontSize: 18.0,
//                      letterSpacing: 0.3,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              height: 60.0,
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black12,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
            ),
          ),
          Positioned(
            left: 10.0,
            right: 10.0,
            bottom: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "(" + widget.ratings.toString() + " Reviews)",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      widget.price == widget.discount
                          ? "\u09F3 " + widget.price.toString()
                          : "\u09F3 " + widget.discount.toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      widget.price == widget.discount
                          ? ""
                          : "\u09F3 " + widget.price.toString(),
                      style: TextStyle(
                        fontSize: 14.0,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.white60,
                      ),
                    ),
//                    Text("\u09F3 " + widget.price.toString(),
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                    Text(
//                      "Min Order",
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
