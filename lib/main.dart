import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provisions/blocs/application_bloc.dart';

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
    return ChangeNotifierProvider(
        create: (context)  => ApplicationBloc(),
      child: MaterialApp(
        title: 'Provisions',
        theme: ThemeData(
          primarySwatch: MyColors.provisionGreen,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      )
    );
  }
}

class MyColors{
  static const MaterialColor provisionGreen = MaterialColor(
    0xFF3DE172,
    <int, Color>{
      50: Color(0xFF3DE172),
      100: Color(0xFF3DE172),
      200: Color(0xFF3DE172),
      300: Color(0xFF3DE172),
      400: Color(0xFF3DE172),
      500: Color(0xFF3DE172),
      600: Color(0xFF3DE172),
      700: Color(0xFF3DE172),
      800: Color(0xFF3DE172),
      900: Color(0xFF3DE172),
    },
  );

  static const MaterialColor provisionKhaki = MaterialColor(
    0xFFFFF7B4,
    <int, Color>{
      50: Color(0xFFFFF7B4),
      100: Color(0xFFFFF7B4),
      200: Color(0xFFFFF7B4),
      300: Color(0xFFFFF7B4),
      400: Color(0xFFFFF7B4),
      500: Color(0xFFFFF7B4),
      600: Color(0xFFFFF7B4),
      700: Color(0xFFFFF7B4),
      800: Color(0xFFFFF7B4),
      900: Color(0xFFFFF7B4),
    },
  );
}
