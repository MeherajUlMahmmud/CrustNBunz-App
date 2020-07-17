import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodapp/src/models/user_model.dart';
import 'package:foodapp/src/utils/firebase_repository.dart';
import 'package:foodapp/src/utils/functions.dart';
import 'package:foodapp/src/widgets/small_button.dart';

import 'favorites_page.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

final FirebaseRepository _repository = FirebaseRepository();

class _PersonPageState extends State<PersonPage> {
  User currentUser;
  String currentUserId;
  String photoUrl = "gs://fooddelivery-7571a.appspot.com/placeholder.png";
  String username;
  String name;
  bool turnOnNotification = false;
  bool turnOnLocation = false;

  @override
  void initState() {
    super.initState();
    _repository.getCurrentUser().then((user) {
      setState(() {
        currentUserId = user.uid;
//        currentUser = user.fromMap(currentUserId, user);
        name = user.displayName;
        photoUrl = user.photoUrl;
//        username =
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
//                        backgroundImage: NetworkImage(
//                            "https://lh3.googleusercontent.com/a-/AOh14GhUyuxd7ZMf7XJinmP41LSVKmgKlgnIKl8Avbuy=s96-c"),
                      backgroundImage: NetworkImage(photoUrl),
                      ),
                    ),
                    SizedBox(width: 25.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "$name",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                        ),
                        Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        SmallButton(btnText: "Edit"),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () {},
                          leading: Icon(Feather.map_pin),
                          title: Text("Location"),
                        ),
                        Divider(
                          height: 10.0,
                          indent: 20.0,
                          color: Colors.grey,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Feather.lock),
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
                          leading: Icon(Feather.credit_card),
                          title: Text("Payment"),
                        ),
                        Divider(
                          height: 10.0,
                          indent: 20.0,
                          color: Colors.grey,
                        ),
                        ListTile(
                          onTap: () {
                            _pushPage(Favorites());
                          },
                          leading: Icon(Feather.heart),
                          title: Text("Favorites"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Others",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
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
                        Divider(
                          height: 10.0,
                          indent: 10.0,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15.0),
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
                          indent: 10.0,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15.0),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _pushPage(Widget page) {
    Functions.pushPage(
      context,
      page,
    );
  }

  _pushPageDialog(Widget page) {
    Functions.pushPageDialog(
      context,
      page,
    );
  }
}
