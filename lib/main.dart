import 'package:flutter/material.dart';
import 'package:provisions/MainPage.dart';

import 'package:provisions/Pages/favorites.dart';
import 'package:provisions/Pages/maps.dart';
import 'package:provisions/Pages/profile.dart';
import 'package:provisions/index.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:provisions/Login/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
/*
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
*/


/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          print("Couldn't Connect");
        }
        if(snapshot.connectionState == ConnectionState.done){
          return MaterialApp(
            title: 'Provisions',
            theme: ThemeData(
              primarySwatch: Colors.green
            ),
            home: LoginPage(),
          );
        }
        Widget loading = MaterialApp();
        return loading;
      });
  }
}
*/