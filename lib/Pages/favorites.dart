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
      backgroundColor: Color(0xFFf4f4f0),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            child: ListTile(
              title: Text("Favorited Location 1"),
              subtitle: Text("Location Details"),
              trailing: Icon(Icons.star),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Favorited Location 2"),
              subtitle: Text("Location Details"),
              trailing: Icon(Icons.star),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Favorited Location 3"),
              subtitle: Text("Location Details"),
              trailing: Icon(Icons.star),
            ),
          ),
        ],
      ),
    );
  }
}