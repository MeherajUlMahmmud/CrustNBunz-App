import 'package:flutter/material.dart';
import 'package:foodapp/src/scoped_model/category_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/category_card.dart';
import 'package:scoped_model/scoped_model.dart';

class CategoryPage extends StatefulWidget {
  final MainModel model;

  CategoryPage({this.model});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  GlobalKey<ScaffoldState> _categoryPageScaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.model.fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _categoryPageScaffoldKey,
        body: ScopedModelDescendant<MainModel>(
            builder: (BuildContext sctx, Widget child, MainModel model) {
//          model.fetchCategory();
          return Container(
            child: ListView.builder(
              itemCount: model.categoryLength,
              itemBuilder: (BuildContext lctx, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: CategoryCard(
                    model.categories[index].categoryName,
                  ),
                );
              },
            ),
          );
        }));
  }
}
