import 'dart:convert';
import 'package:foodapp/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];

  List<Food> get foods {
    return List.from(_foods);
  }

  void addFood(Food food) async {
//    _foods.add(food);
    final Map<String, dynamic> foodData = {
      "title": food.name,
      "description": food.description,
      "category": food.category,
      "price": food.price,
      "discount": food.discount,

    };
    final http.Response response = await http
        .post("https://fooddelivery-7571a.firebaseio.com/foods.json",
        body: json.encode(foodData));

    final Map<String, dynamic> responseData = json.decode(response.body);

    Food foodWithId = Food(
      id: responseData["name"],
      name: food.name,
      category: food.category,
      description: food.description,
      price: food.price,
      discount: food.discount,
    );

    _foods.add(foodWithId);
          print(_foods[0].category);
//    print(responseData["name"]);
  }

  void fetchFood() {
    http
        .get("https://fooddelivery-7571a.firebaseio.com/foods.json")
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
