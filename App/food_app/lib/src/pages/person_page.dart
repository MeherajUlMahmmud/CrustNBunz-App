import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/src/widgets/small_button.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  bool turnOnNotification = false;
  bool turnOnLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4.0),
                            blurRadius: 5.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Image.asset(("assets/images/breakfast.png")),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Meheraj Mahmmud",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                        Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SmallButton(btnText: "Edit"),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.location_on),
                          title: Text("Location"),
                        ),
                        Divider(
                          height: 10.0,
                          indent: 20.0,
                          color: Colors.grey,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.vpn_key),
                          title: Text("Change Password"),
                        ),
                        Divider(
                          height: 10.0,
                          indent: 20.0,
                          color: Colors.grey,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.local_shipping),
                          title: Text("Shipping"),
                        ),
                        Divider(
                          height: 10.0,
                          indent: 20.0,
                          color: Colors.grey,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.payment),
                          title: Text("Payment"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "App Notifications",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Switch(
                                value: turnOnNotification,
                                onChanged: (bool value) {
                                  setState(() {
                                    turnOnNotification = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 10.0,
                          indent: 10.0,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Location tracking",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Switch(
                                value: turnOnLocation,
                                onChanged: (bool value) {
                                  setState(() {
                                    turnOnLocation = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Other",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Card(
                  elevation: 5.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Language",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "English",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                        indent: 15.0,
                        endIndent: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Currency",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "\u09F3",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            ),
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
      ),
    );
  }
}
