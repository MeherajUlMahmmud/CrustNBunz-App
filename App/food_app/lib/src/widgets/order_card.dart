import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 75.0,
              width: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  width: 2.0,
                  color: Colors.grey,
                ),
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFFD3D3D3),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/lunch.jpeg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(35.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
//                    offset: Offset(0.0, 0.5),
                    ),
                  ]),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hot Coffee",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "\u09F3 3.0",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: 25.0,
                  width: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Milk",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "x",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Milk",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "x",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Milk",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "x",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
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
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
