import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodapp/src/models/food_model.dart';

class FoodDetailsPage extends StatelessWidget {
  final Food food;

  FoodDetailsPage({this.food});

  @override
  Widget build(BuildContext context) {
    double price = food.price;
    double discount = food.price - food.discount;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
//    print(height - 230);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: 250.0,
                  width: width,
                  child: Image.asset("assets/images/lunch.jpeg",
                      fit: BoxFit.cover),
                ),
                Positioned(
                  top: 0.0,
                  child: Container(
                    height: 50.0,
                    width: width,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Feather.chevron_left,
                        color: Colors.black,
                      )),
                ),
                Positioned(
                  top: 220.0,
                  child: Container(
                    width: width,
                    height: height - 230.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15.0),
                          height: 40.0,
                          alignment: Alignment.centerLeft,
//                          color: Colors.redAccent,
                          child: Text(
                            food.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15.0),
                          height: 40.0,
                          alignment: Alignment.centerLeft,
//                          color: Colors.greenAccent,
                          child: Text(
                            "Min. order quantity: 1 Unit",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          height: 120.0,
                          width: width,
//                          color: Colors.grey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Details",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                food.description,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15.0),
                          height: 60.0,
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Feather.plus_square,
                                      size: 30.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "01",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Feather.minus_square,
                                      size: 30.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: <Widget>[
                                  Text(
                                    price == discount
                                        ? "\u09F3 " + price.toString()
                                        : "\u09F3 " + discount.toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    price == discount
                                        ? ""
                                        : "\u09F3 " + price.toString(),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 90.0,
//                          color: Colors.purple,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 10.0),
                                padding: EdgeInsets.all(10.0),
                                width: width * 0.2,
                                height: width * 0.2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.4),
                                  ),
                                ),
                                child: Icon(
                                  Feather.heart,
                                  size: 40.0,
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.4),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                padding: EdgeInsets.all(10.0),
                                width: width * 0.72,
                                height: width * 0.2,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Feather.shopping_cart,
                                      size: 30.0,
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
                                        fontSize: 18.0,
                                        letterSpacing: 0.3,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
