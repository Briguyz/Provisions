import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provisions/GetName.dart';
import 'package:provisions/GetEmail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
} //MyHomePage

class HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth auth = FirebaseAuth.instance;

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
      backgroundColor: Color(0xFFf4f4f0),
      body: ListView(
        padding: const EdgeInsets.all(8),
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
            child: ListTile(
              title: Text("Event 1"),
              subtitle: Text("Event Details"),
              leading: Icon(Icons.event),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Event 2"),
              subtitle: Text("Event Details"),
              leading: Icon(Icons.event),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Event 3"),//GetEvents(documentId: auth.currentUser!.uid),
              subtitle: Text("Event Details"),
              leading: Icon(Icons.event),
            ),
          ),
        ],
      ),

    );
  }
}