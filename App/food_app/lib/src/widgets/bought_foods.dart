import 'package:flutter/material.dart';

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
    double height = MediaQuery.of(context).size.height;

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
                      "1.0",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Min Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
