import 'dart:convert';
import 'package:foodapp/src/models/category_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class CategoryModel extends Model {
  List<Category> _categories = [];
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  List<Category> get categories {
    return List.from(_categories);
  }

  int get categoryLength {
    return _categories.length;
  }

  Future<bool> addCategory(Category category) async {
    _isLoading = true;
    notifyListeners();

    try {
      final Map<String, dynamic> categoryData = {
        "title": category.categoryName,
      };
      final http.Response response = await http.post(
          "https://fooddelivery-7571a.firebaseio.com/category.json",
          body: json.encode(categoryData));

      final Map<String, dynamic> responeData = json.decode(response.body);

      Category categoryWithID = Category(
        id: responeData["name"],
        categoryName: category.categoryName,
      );

      _categories.add(categoryWithID);
      _isLoading = false;
      notifyListeners();
      // fetchFoods();
      return Future.value(true);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
      // print("Connection error: $e");
    }
  }

  Future<bool> fetchCategory() async {
    _isLoading = true;
    notifyListeners();

    try {
      final http.Response response = await http
          .get("https://fooddelivery-7571a.firebaseio.com/category.json");

      // print("Fecthing data: ${response.body}");
      final Map<String, dynamic> fetchedData = json.decode(response.body);
      print(fetchedData);

      final List<Category> categoryItems = [];

      fetchedData.forEach((String id, dynamic categoryData) {
        Category categoryItem = Category(
          id: id,
          categoryName: categoryData["title"],
        );

        categoryItems.add(categoryItem);
      });

      _categories = categoryItems;
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      print("The error: $error");
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }
}
