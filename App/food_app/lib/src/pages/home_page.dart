import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/global.dart';
import 'package:foodapp/src/scoped_model/food_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/home_top_info.dart';
import 'package:foodapp/src/widgets/food_category.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/search_field.dart';
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
    // TODO: implement initState
//    widget.foodModel.fetchFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
//          padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          children: <Widget>[
            HomeTopInfo(),
//            SearchField(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                children: <Widget>[
                  FoodCategory(),
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
                    builder: (BuildContext context, Widget child, MainModel model) {
                      return Column(
                        children: model.foods
                            .map(_buildFoodItems)
                            .toList(),
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
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: BoughtFoods(
        id: food.id,
        imagePath: food.imagePath,
        name: food.name,
        category: food.category,
        price: food.price,
        discount: food.discount,
        ratings: food.ratings,
      ),
    );
  }
}
