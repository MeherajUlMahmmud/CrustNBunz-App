import 'package:flutter/material.dart';
import 'package:foodapp/src/admin/pages/add_food_items.dart';
import 'package:foodapp/src/scoped_model/food_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/favorite_page.dart';
import '../pages/person_page.dart';

class MainScreen extends StatefulWidget {
  final MainModel model;

  MainScreen({this.model});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;

  //pages
  List<Widget> pages;
  Widget currentPage;
  HomePage homePage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  PersonPage personPage;

  @override
  void initState() {
    widget.model.fetchFood();

    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = FavoritePage();
    personPage = PersonPage();
    pages = [homePage, favoritePage, orderPage, personPage];

    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AddFoodItem()));
                },
                leading: Icon(Icons.add),
                title: Text("Add food item"),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
          child: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                currentTabIndex = index;
                currentPage = pages[index];
              });
            },
            elevation: 5.0,
            backgroundColor: Colors.transparent,
            currentIndex: currentTabIndex,
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black38,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: IconThemeData(
              size: 25.0,
              color: Colors.black,
            ),
            unselectedIconTheme: IconThemeData(
              size: 20.0,
            ),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                ),
                title: Text("Explore"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                title: Text("Orders"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                title: Text("Profile"),
              )
            ],
          ),
        ),
        body: currentPage,
      ),
    );
  }
}
