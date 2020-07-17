import 'package:flutter/material.dart';
import 'package:foodapp/src/models/category_model.dart';
import 'package:foodapp/src/scoped_model/category_model.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/widgets/button.dart';
import 'package:foodapp/src/widgets/show-dialog.dart';
import 'package:scoped_model/scoped_model.dart';

class AddCategoryItem extends StatefulWidget {
  final Category category;

  AddCategoryItem({this.category});

  @override
  _AddCategoryItemState createState() => _AddCategoryItemState();
}

class _AddCategoryItemState extends State<AddCategoryItem> {
  String title;

  GlobalKey<FormState> _categoryItemKey = GlobalKey();
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
              key: _categoryItemKey,
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
                  _buildTextFormField("Category name"),
                  SizedBox(
                    height: 15.0,
                  ),
                  ScopedModelDescendant(builder:
                      (BuildContext context, Widget child, MainModel model) {
                    return GestureDetector(
                      onTap: () {
                        onSubmit(model.addCategory);
                        if (model.isLoading) {
                          showLoadingIndicator(
                              context, "Adding Category Item...");
                        }
                      },
                      child: Button(btnText: "Add Category"),
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

  void onSubmit(Function addCategory) async {
    if (_categoryItemKey.currentState.validate()) {
      _categoryItemKey.currentState.save();

      final Category food = Category(
        categoryName: title,
      );
      bool value = await addCategory(food);
      if (value) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text("Category item successfully added."),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.blueAccent,
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);
      } else if (!value) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text("Failed to add Category item."),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);
      }
    }
  }

  Widget _buildTextFormField(String hint) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
      ),
      keyboardType: TextInputType.text,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty && hint == "Category name") {
          return "A " + hint + " is required";
        }
      },
      onSaved: (String value) {
        if (hint == "Category name") {
          title = value;
        }
      },
    );
  }
}
