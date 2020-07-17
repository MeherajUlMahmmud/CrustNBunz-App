import 'package:foodapp/src/scoped_model/category_model.dart';
import 'package:foodapp/src/scoped_model/food_model.dart';
import 'package:foodapp/src/scoped_model/user_scoped_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with FoodModel, CategoryModel/*, UserModel*/ {}
