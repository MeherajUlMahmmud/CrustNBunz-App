import 'dart:convert';
import 'package:foodapp/src/models/category_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class CategoryModel extends Model {
  List<Category> _categories = [];

  List<Category> get categories {
    return List.from(_categories);
  }

  void addCategory(Category category) {
    _categories.add(category);
  }

  void fetchCategory() {
    http
        .get("http://192.168.0.103/flutter_food_app/api/categories/getCategories.php")
        .then((http.Response response) {
      final List fetchData = json.decode(response.body);
//      print(fetchData);
//      print("111111");
      final List<Category> fetchCategoryItems = [];

      fetchData.forEach((element) {
        Category category = Category(
          id: element["id"],
          categoryName: element["name"],
          imagePath: element["image_path"],
          numberOfItems: element["kinds"],
        );

        fetchCategoryItems.add(category);
      });
      _categories = fetchCategoryItems;
          print(_categories[0].categoryName);
    });
  }
}
