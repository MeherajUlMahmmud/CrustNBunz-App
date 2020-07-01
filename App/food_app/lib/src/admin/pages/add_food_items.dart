import 'package:flutter/material.dart';
import 'package:foodapp/src/models/food_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/button.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  String title;
  String cat;
  String desc;
  String price;
  String discount;

  GlobalKey<FormState> _foodItemKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      key: _scaffoldStateKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//            width: size.width,
//            height: size.height,
            child: Form(
              key: _foodItemKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/noimage.png")),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildTextFormField("Food name"),
                  _buildTextFormField("Category"),
                  _buildTextFormField("Description", maxLine: 5),
                  _buildTextFormField("Price"),
                  _buildTextFormField("Discount"),
                  SizedBox(
                    height: 15.0,
                  ),
                  ScopedModelDescendant(builder:
                      (BuildContext context, Widget child, MainModel model) {
                    return GestureDetector(
                      onTap: () {
                        onSubmit(model.addFood);
                        if (model.isLoading) {
                          showLoadingIndicator();
                        }
                      },
                      child: Button(btnText: "Add Food"),
                    );
                  }),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit(Function addFood) async {
    if (_foodItemKey.currentState.validate()) {
      _foodItemKey.currentState.save();

      final Food food = Food(
        name: title,
        category: cat,
        description: desc,
        price: double.parse(price),
        discount: double.parse(discount),
      );
      bool value = await addFood(food);
      if(value) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text("Food item successfully added.")
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);
      }
      else if(!value) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
            content: Text("Failed to add food item.")
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);
      }
    }
  }

  Future<void> showLoadingIndicator() {
    return showDialog(context: context, barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(width: 10.0,),
                Text("Adding new food item...")
              ],
            ),
          );
        });
  }

  Widget _buildTextFormField(String hint, {int maxLine = 1}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
      ),
      maxLines: maxLine,
      keyboardType: hint == "Price" || hint == "Discount"
          ? TextInputType.number
          : TextInputType.text,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty && hint == "Food name") {
          return "A " + hint + " is required";
        }
        if (value.isEmpty && hint == "Category") {
          return "A " + hint + " is required";
        }
        if (value.isEmpty && hint == "Description") {
          return "A " + hint + " is required";
        }
        if (value.isEmpty && hint == "Price") {
          return "A " + hint + " is required";
        }
        if (value.isEmpty && hint == "Discount") {
          return "A " + hint + " is required";
        }
      },
      onChanged: (String value) {
        if (hint == "Food name") {
          title = value;
        }
        if (hint == "Category") {
          cat = value;
        }
        if (hint == "Description") {
          desc = value;
        }
        if (hint == "Price") {
          price = value;
        }
        if (hint == "Discount") {
          discount = value;
        }
      },
    );
  }
}
