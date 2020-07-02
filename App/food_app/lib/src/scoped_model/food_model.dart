import 'dart:convert';
import 'package:foodapp/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  List<Food> get foods {
    return List.from(_foods);
  }

  Future<bool> addFood(Food food) async {
    _isLoading = true;
    notifyListeners();

    try {
      final Map<String, dynamic> foodData = {
        "title": food.name,
        "description": food.description,
        "category": food.category,
        "price": food.price,
        "discount": food.discount,
      };
      final http.Response response = await http.post(
          "https://fooddelivery-7571a.firebaseio.com/foods.json",
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
      _isLoading = false;
      notifyListeners();
//      fetchFood();
      return Future.value(true);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> fetchFood() async {
    bool _isLoading = true;
    notifyListeners();
    try {
      final http.Response response = await http
          .get("https://fooddelivery-7571a.firebaseio.com/foods.json");

      final Map<String, dynamic> fetchedData = json.decode(response.body);
      final List<Food> fetchedFoodItems = [];

      fetchedData.forEach((String id, dynamic foodData) {
        Food food = Food(
          id: id,
          name: foodData["title"],
          category: foodData["category"],
          description: foodData["description"],
          price: double.parse(foodData["price"]),
          discount: double.parse(foodData["discount"]),
//          imagePath: foodData["image_path"],
//          ratings: double.parse(foodData["ratings"]),
        );

        fetchedFoodItems.add(food);
      });
      _foods = fetchedFoodItems;
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }
}
