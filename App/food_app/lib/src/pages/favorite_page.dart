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
    Size size = MediaQuery.of(context).size;

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
      body: Container(
        height: 140.0,
//        color: Colors.red,
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(10.0),
//          boxShadow: [
//            BoxShadow(
//              offset: Offset(0, 0.5),
//              blurRadius: 5.0,
//              color: Colors.black38,
//            ),
//          ],
//        ),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
//                height: 90.0,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/breakfast.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
//                color: Colors.yellow,
                width: size.width * 0.55,
                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(height: 40.0, child: Text("This is the description. It might be long. It might be long.")),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "250.0",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SmallButton(btnText: "Buy Now"),
                      ],
                    ),
                  ],
                ),
              ),
//            Positioned(
//              right: 0.0,
//              width: MediaQuery.of(context).size.width * 0.7,
//              height: 120.0,
//              child: Card(
//                child: Container(
//                ),
//              ),
//            ),
            ],
          ),
        ),
      ),
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
