import 'package:flutter/material.dart';

import 'package:foodapp/global.dart';
import 'package:foodapp/src/widgets/search_field.dart';

class HomeTopInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.2 + 60,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70.0),
                bottomLeft: Radius.circular(70.0),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.2 + 20,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(36.0),
                      bottomLeft: Radius.circular(36.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("What are", style: titleStyle),
                            Text("you craving for?", style: titleStyle)
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.notifications_none,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 20.0,
                            color: Colors.blueAccent.withOpacity(0.5)),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    child: SearchField(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
