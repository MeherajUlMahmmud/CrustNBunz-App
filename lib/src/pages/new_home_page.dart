import 'package:flutter/material.dart';
import 'package:foodapp/src/widgets/search_field.dart';

import 'popular.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: SearchField(),
            ),
            TabBar(
              controller: tabController,
              indicatorColor: Colors.lightGreen,
              indicatorWeight: 3.0,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Popular",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Tab(
                  child: Text(
                    "Recent",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Tab(
                  child: Text(
                    "Offers",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Tab(
                  child: Text(
                    "What's now",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    Popular(),
                    Popular(),
                    Popular(),
                    Popular(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
