import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/src/models/category_model.dart';
import 'package:foodapp/src/models/food_model.dart';
import 'package:foodapp/src/scoped_model/category_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/category_card.dart';
import 'package:foodapp/src/widgets/food_category.dart';
import 'package:foodapp/src/widgets/food_item_card.dart';
import 'package:foodapp/src/widgets/order_card.dart';
import 'package:foodapp/src/widgets/search_field.dart';
import 'package:foodapp/src/widgets/small_button.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoritePage extends StatefulWidget {
  final CategoryModel categoryModel;

  FavoritePage({this.categoryModel});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    // TODO: implement initState
//    widget.categoryModel.fetchCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore Foods",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: ScopedModelDescendant(
          builder: (BuildContext context, Widget child, MainModel model) {
            model.fetchFood();
            List<Food> foods = model.foods;
            return RefreshIndicator(
              onRefresh: model.fetchFood,
              child: Column(
                children: foods.map((Food food) {
                  return FoodItemCard(
                    food.name,
                    food.description,
                    food.price.toString(),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
