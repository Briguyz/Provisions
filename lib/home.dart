import 'package:flutter/material.dart';
import 'package:provisions/home.dart';
import 'package:provisions/maps.dart';
import 'package:provisions/events.dart';
import 'package:provisions/favorites.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
} //MyHomePage

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Provisions'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Events will end up populating this area in a future build',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
        )
      ),
    );
  }
}


