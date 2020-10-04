import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weatherApp/Signup.dart';
import 'package:weatherApp/data.dart';
import 'package:weatherApp/login.dart';

import 'package:weatherApp/widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(WeatherApp());
}

// default key= 3b43dbbec4befe51328eb77475fe899e
class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WeatherApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.lightBlue,
          accentColor: Colors.blueAccent,
          primarySwatch: Colors.blueGrey),
      home: LoginPage(),
    );
  }
}
