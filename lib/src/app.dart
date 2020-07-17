import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/src/pages/new_home_page.dart';
import 'package:foodapp/src/pages/signin_page.dart';
import 'package:foodapp/src/scoped_model/main_model.dart';
import 'package:foodapp/src/utils/firebase_repository.dart';
import 'package:scoped_model/scoped_model.dart';
import '../theme.dart';
import 'screens/main_screen.dart';

// ignore: must_be_immutable
class App extends StatelessWidget {
  final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context) {

    FirebaseRepository _repository = FirebaseRepository();

    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.lightGreen,
          backgroundColor: Colors.white,
          cursorColor: Colors.lightGreen,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 0.0,
          ),
        ),
//        theme: ThemeData.lightTheme(),
//        darkTheme: ThemeData.darkTheme()
//        home: MainScreen(model: mainModel),
        initialRoute: "/",
        routes: {
          "/mainScreen": (BuildContext context) => MainScreen(model: mainModel),
        },
        home: FutureBuilder(
          future: _repository.getCurrentUser(),
          builder: (context, AsyncSnapshot<FirebaseUser>snapshot) {
            if(snapshot.hasData) {
              return MainScreen(model: mainModel);
            } else {
              return SignInPage();
            }
          },
        ),
      ),
    );
  }
}
