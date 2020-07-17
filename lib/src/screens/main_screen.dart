import 'package:flutter/material.dart';
import 'package:foodapp/src/admin/pages/add_category_item.dart';
import 'package:foodapp/src/admin/pages/add_food_items.dart';
import 'package:foodapp/src/pages/category_page.dart';
import 'package:foodapp/src/pages/new_home_page.dart';
import 'package:foodapp/src/pages/settings_page.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/explore_page.dart';
import '../pages/person_page.dart';
import 'package:flutter_icons/flutter_icons.dart';

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

//  HomePage homePage;
  OrderPage orderPage;

//  ExplorePage explorePage;
  PersonPage personPage;

  MainPage mainPage;
  CategoryPage categoryPage;

  @override
  void initState() {
    widget.model.fetchFood();

//    homePage = HomePage();
    orderPage = OrderPage();
//    explorePage = ExplorePage(model: widget.model);
    personPage = PersonPage();
    mainPage = MainPage();
    categoryPage = CategoryPage(model: widget.model);
    pages = [mainPage, categoryPage, orderPage, personPage];

    currentPage = mainPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(
          currentTabIndex == 0
              ? "Food App"
              : currentTabIndex == 1
                  ? "Categories"
                  : currentTabIndex == 2 ? "Food Cart" : "Profile",
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Feather.bell,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Feather.settings,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Settings()));
            },
          ),
        ],
      ),
//        drawer: Drawer(
//          child: Column(
//            children: <Widget>[
//              ListTile(
//                onTap: () {
//                  Navigator.of(context).pop();
//                  Navigator.of(context).push(MaterialPageRoute(
//                      builder: (BuildContext context) => AddFoodItem()));
//                },
//                leading: Icon(Icons.add),
//                title: Text("Add food item"),
//              ),
//              ListTile(
//                onTap: () {
//                  Navigator.of(context).pop();
//                  Navigator.of(context).push(MaterialPageRoute(
//                      builder: (BuildContext context) => AddCategoryItem()));
//                },
//                leading: Icon(Icons.add),
//                title: Text("Add category item"),
//              )
//            ],
//          ),
//        ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey[500],
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTabIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.list,
            ),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.shopping_cart,
            ),
            title: Text("Orders"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.user,
            ),
            title: Text("Profile"),
          )
        ],
      ),
      body: currentPage,
    );
  }
}
