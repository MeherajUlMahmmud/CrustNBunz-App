import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/src/models/category_model.dart';
import 'package:foodapp/src/scoped_model/category_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/category_card.dart';
import 'package:foodapp/src/widgets/food_category.dart';
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
          "Categories",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
//          FoodCategory(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
        ],
      ),
//      body: SafeArea(
//        child: SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              Container(
//                margin: EdgeInsets.all(10.0),
//                child: Text(
//                  "Categories",
//                  style: TextStyle(
//                    fontSize: 22.0,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.all(10.0),
//                child: SearchField(),
//              ),
//              FoodCategory(),
////            ListView(
////              children: <Widget>[
//////                FoodCategory(),
////              ],
////            ),
////            ScopedModelDescendant<CategoryScopedModel>(
////              builder: (BuildContext context, Widget child,
////                  CategoryScopedModel model) {
////                return Column(
////                  children: model.categories.map(_buildCategoryItems).toList(),
////                );
////              },
////            )
//            ],
//          ),
//        ),
//      ),
    );
  }

  Widget _buildCategoryItems(Category category) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: CategoryCard(
        id: category.id,
        imagePath: category.imagePath,
        categoryName: category.categoryName,
        numberOfItems: category.numberOfItems,
      ),
    );
  }
}
