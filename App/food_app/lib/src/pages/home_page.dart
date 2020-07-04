import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/global.dart';
import 'package:foodapp/src/pages/food_details_page.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/home_top_info.dart';
import 'package:foodapp/src/widgets/food_category.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/bought_foods.dart';
import '../models/food_model.dart';

class HomePage extends StatefulWidget {
//  final FoodModel foodModel;
//
//  HomePage(this.foodModel);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            HomeTopInfo(),
//            SearchField(),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Frequently bought items",
                        style: frequentTextStyle,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View all",
                          style: viewAllTextStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  ScopedModelDescendant<MainModel>(
                    builder:
                        (BuildContext context, Widget child, MainModel model) {
                      return Column(
                        children: model.foods.map(_buildFoodItems).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItems(Food food) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => FoodDetailsPage(),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.0),
        child: BoughtFoods(
          id: food.id,
          imagePath: "assets/images/lunch.jpeg",
          name: food.name,
          category: food.category,
          price: food.price,
          discount: food.discount,
          ratings: food.ratings,
        ),
      ),
    );
  }
}
