import 'package:flutter/material.dart';
import "dart:async";
import 'src/app.dart';

void main() {
  runApp(App());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: Splash(),
      routes: {
        '/App': (context) => App(),
      },
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.of(context).pushNamed('/App'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(),
              Text(
                "Food App",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
