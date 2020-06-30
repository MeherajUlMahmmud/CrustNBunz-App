import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/category_data.dart';
import '../models/category_model.dart';
import 'category_card.dart';

class FoodCategory extends StatelessWidget {
  final List<Category> _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            categoryName: _categories[index].categoryName,
            imagePath: _categories[index].imagePath,
            numberOfItems: _categories[index].numberOfItems,
          );
        },
      ),
    );
  }
}
