import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/src/admin/pages/add_food_items.dart';
import 'package:foodapp/src/models/food_model.dart';
import 'package:foodapp/src/pages/food_details_page.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/food_item_card.dart';
import 'package:foodapp/src/widgets/show-dialog.dart';
import 'package:scoped_model/scoped_model.dart';

// ignore: must_be_immutable
class ExplorePage extends StatefulWidget {
  final MainModel model;

  ExplorePage({this.model});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  GlobalKey<ScaffoldState> _explorePageScaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.model.fetchFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _explorePageScaffoldKey,
      body: ScopedModelDescendant(
        builder: (BuildContext sctx, Widget child, MainModel model) {
          return Container(
            child: RefreshIndicator(
              onRefresh: model.fetchFood,
              child: ListView.builder(
                itemCount: model.foodLength,
                itemBuilder: (BuildContext lctx, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            FoodDetailsPage(food: model.foods[index]),
                      ));
                    },
//                    onTap: () async {
//                      final bool response =
//                          await Navigator.of(context).push(MaterialPageRoute(
//                              builder: (BuildContext mctx) => AddFoodItem(
//                                    food: model.foods[index],
//                                  )));
//                      if (response) {
//                        SnackBar snackBar = SnackBar(
//                          duration: Duration(seconds: 2),
//                          backgroundColor: Colors.blueAccent,
//                          content: Text(
//                            "Food item successfully updated.",
//                            style: TextStyle(
//                              color: Theme.of(context).primaryColor,
//                              fontSize: 16.0,
//                            ),
//                          ),
//                        );
//                        _explorePageScaffoldKey.currentState
//                            .showSnackBar(snackBar);
//                      }
//                    },
//                    onDoubleTap: () {
//                      showLoadingIndicator(context, "Deleting food item.");
//                      model.deleteFood(model.foods[index].id).
//                      then((bool response) {
//                        Navigator.of(context).pop();
//                      });
//                    },
                    child: FoodItemCard(
                      model.foods[index].name,
                      model.foods[index].description,
                      model.foods[index].price.toString(),
                      (model.foods[index].price - model.foods[index].discount)
                          .toString(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
