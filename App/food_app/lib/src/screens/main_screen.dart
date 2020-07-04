import 'package:flutter/material.dart';
import 'package:foodapp/src/admin/pages/add_category_item.dart';
import 'package:foodapp/src/admin/pages/add_food_items.dart';
import 'package:foodapp/src/pages/category_page.dart';
import 'package:foodapp/src/pages/new_home_page.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/explore_page.dart';
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
  ExplorePage explorePage;
  PersonPage personPage;

  MainPage mainPage;
  CategoryPage categoryPage;

  @override
  void initState() {
    widget.model.fetchFood();

    homePage = HomePage();
    orderPage = OrderPage();
    explorePage = ExplorePage(model: widget.model);
    personPage = PersonPage();
    mainPage = MainPage();
    categoryPage = CategoryPage(model: widget.model);
    pages = [mainPage, categoryPage, orderPage, personPage];

    currentPage = mainPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            currentTabIndex == 0
                ? "Food App"
                : currentTabIndex == 1
                    ? "Explore Foods"
                    : currentTabIndex == 2 ? "Food Cart" : "Profile",
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_none,
              ),
              onPressed: () {},
            ),
//            IconButton(
//              icon: Icon(
//                Icons.shopping_basket,
//              ),
//              onPressed: () {},
//            )
          ],
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
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AddCategoryItem()));
                },
                leading: Icon(Icons.add),
                title: Text("Add category item"),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            color: Colors.black,
            fontSize: 12.0,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.black38,
            fontSize: 10.0,
          ),
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
                Icons.widgets,
              ),
              title: Text("Category"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket,
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
        body: currentPage,
      ),
    );
  }
}
