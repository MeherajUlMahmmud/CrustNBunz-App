import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodapp/src/models/category_model.dart';
import 'package:foodapp/src/models/food_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:foodapp/src/models/user_model.dart';
import 'package:foodapp/src/utils/utility.dart';

class FirebaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  static final Firestore firestore = Firestore.instance;

  User user = User();

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    return currentUser;
  }

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _signInAuthentication =
        await _signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: _signInAuthentication.accessToken,
        idToken: _signInAuthentication.idToken);

    AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    return user;
  }

  Future<bool> authenticateUser(FirebaseUser user) async {
    QuerySnapshot result = await firestore
        .collection("users")
        .where("email", isEqualTo: user.email)
        .getDocuments();

    final List<DocumentSnapshot> docs = result.documents;

    return docs.length == 0 ? true : false;
  }

  Future<void> addDataToDb(FirebaseUser currentUser) async {
    String username = Utils.getUsername(currentUser.email);

    user = User(
      uid: currentUser.uid,
      name: currentUser.displayName,
      email: currentUser.email,
      profilePhoto: currentUser.photoUrl,
      username: username,
    );

    firestore
        .collection("users")
        .document(currentUser.uid)
        .setData(user.toMap(user));
  }

  Future<void> signOut() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    return await _auth.signOut();
  }

//  Future<List<Food>> fetchAllFoods() async {
//    QuerySnapshot result = await firestore
//        .collection("food")
//        .getDocuments();
//
//    final List<DocumentSnapshot> docs = result.documents;
//    return docs;
//  }
//
//  Future<List<Category>> fetchAllCategories() async {
//    QuerySnapshot result = await firestore
//        .collection("category")
//        .getDocuments();
//
//    final List<DocumentSnapshot> docs = result.documents;
//    return docs;
//  }

}
