import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
    );
  }
}