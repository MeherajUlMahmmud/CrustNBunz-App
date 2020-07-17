import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodapp/src/models/category_model.dart';
import 'package:foodapp/src/models/food_model.dart';
import 'package:foodapp/src/models/user_model.dart';
import 'firebase_methods.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<FirebaseUser> getCurrentUser() => _firebaseMethods.getCurrentUser();

  Future<FirebaseUser> signIn() => _firebaseMethods.signIn();

  Future<bool> authenticateUser(FirebaseUser user) =>
      _firebaseMethods.authenticateUser(user);

  Future<void> addDataToDb(FirebaseUser user) =>
      _firebaseMethods.addDataToDb(user);

  Future<void> signOut() => _firebaseMethods.signOut();

//  Future<List<Food>> fetchAllFoods() => _firebaseMethods.fetchAllFoods();
//
//  Future<List<Category>> fetchAllCategories() => _firebaseMethods.fetchAllCategories();

}
