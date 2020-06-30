import 'package:flutter/material.dart';

class AddFoodItem extends StatefulWidget {
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 16.0),
          width: size.width,
          height: size.height,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 15.0,),
              Container(
                width: size.width,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/noimage.png")
                  ),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              _buildTextFormField("Food name"),
              _buildTextFormField("Category"),
              _buildTextFormField("Description", maxLine: 5),
              _buildTextFormField("Price"),
              _buildTextFormField("Discount"),
              SizedBox(height: 15.0,),
              Container(
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blueAccent,
                ),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(
                      "Add Food",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0,),
            ],
          ),
        ),
      ),
    );
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
    );
  }
}
