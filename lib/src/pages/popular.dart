import 'package:flutter/material.dart';
import 'package:foodapp/src/models/food_model.dart';
import 'package:foodapp/src/pages/food_details_page.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/bought_foods.dart';
import 'package:scoped_model/scoped_model.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            child: ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
                return Column(
                  children: model.foods.map(_buildFoodItems).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItems(Food food) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => FoodDetailsPage(food: food),
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
          discount: food.price - food.discount,
          ratings: food.ratings,
        ),
      ),
    );
  }
}
