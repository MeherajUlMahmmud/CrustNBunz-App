import 'dart:convert';
import 'package:foodapp/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];

  List<Food> get foods {
    return List.from(_foods);
  }

  void addFood(Food food) {
    _foods.add(food);
  }

  void fetchFood() {
    http
        .get("http://192.168.0.103/flutter_food_app/api/foods/getFoods.php")
        .then((http.Response response) {
      final List fetchData = json.decode(response.body);
      final List<Food> fetchFoodItems = [];

      fetchData.forEach((element) {
        Food food = Food(
          id: element["id"],
          name: element["name"],
          category: element["category"],
          price: double.parse(element["price"]),
          discount: double.parse(element["discount"]),
          imagePath: element["image_path"],
          ratings: double.parse(element["ratings"]),
        );

        fetchFoodItems.add(food);
      });
      _foods = fetchFoodItems;
//          print(_foods[0].name);
    });
  }
}
