import 'package:flutter/material.dart';
import 'package:foodapp/src/models/food_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/button.dart';
import 'package:foodapp/src/widgets/show-dialog.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  final Food food;

  AddFoodItem({this.food});

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
    Size size = MediaQuery.of(context).size;

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
                        onSubmit(model.addFood, model.updateFood);
                        if (model.isLoading) {
                          showLoadingIndicator(
                              context,
                              widget.food != null
                                  ? "Updating Food Item..."
                                  : "Adding Food Item...");
                        }
                      },
                      child: Button(
                          btnText: widget.food != null
                              ? "Update Food Item"
                              : "Add Food"),
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

  void onSubmit(Function addFood, Function updateFood) async {
    if (_foodItemKey.currentState.validate()) {
      _foodItemKey.currentState.save();

      if (widget.food != null) {
        // I want to update the food item
        Map<String, dynamic> updatedFoodItem = {
          "title": title,
          "category": cat,
          "description": desc,
          "price": double.parse(price),
          "discount": double.parse(discount),
        };

        final bool response = await updateFood(updatedFoodItem, widget.food.id);
        if (response) {
          Navigator.of(context).pop(); // to remove the alert Dialog
          Navigator.of(context).pop(response); // to the previous page
        } else if (!response) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
            content: Text(
              "Failed to update food item",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      } else if (widget.food == null) {
        final Food food = Food(
          name: title,
          category: cat,
          description: desc,
          price: double.parse(price),
          discount: double.parse(discount),
        );
        bool value = await addFood(food);
        if (value) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text("Food item successfully added."),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.blueAccent,
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        } else if (!value) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text("Failed to add food item."),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          );
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      }
    }
  }

  Widget _buildTextFormField(String hint, {int maxLine = 1}) {
    return TextFormField(
      initialValue: widget.food != null && hint == "Food name"
          ? widget.food.name
          : widget.food != null && hint == "Category"
              ? widget.food.category
              : widget.food != null && hint == "Description"
                  ? widget.food.description
                  : widget.food != null && hint == "Price"
                      ? widget.food.price.toString()
                      : widget.food != null && hint == "Discount"
                          ? widget.food.discount.toString()
                          : "",
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
//        return "";
      },
      onSaved: (String value) {
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
