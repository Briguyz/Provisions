import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => FavoritesPageState();
} //MyHomePage

class FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/a-logo.png',
              //color: Colors.white,
              fit: BoxFit.contain,
              height: 32,
            ),
            //Container(
            //    padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'))
          ],

        ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}