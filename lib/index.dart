import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provisions/Pages/favorites.dart';
import 'package:provisions/Pages/profile.dart';
import 'package:provisions/Pages/maps.dart';
import 'package:provisions/Pages/home.dart';


class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => IndexPageState();
} //MyHomePage


/*
class HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed in as: ' + user.email!),
          ],
        )
      )
    );
  }
*/




class IndexPageState extends State<IndexPage> {
  // _tappedIndex is an integer that changes according to bottomNavigationBar icon that is clicked.
  // pages[] is used in conjunction with _tappedIndex to navigate through the application's routes in the body.
  int _tappedIndex = 0;
  final pages = [
    HomePage(),
    MapsPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  void _onItemSelected (int index) {
    setState(() {
      _tappedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_tappedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_rounded),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind_rounded),
            label: 'Profile',

          )

        ],
        currentIndex: _tappedIndex,
        unselectedItemColor: Colors.grey,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        //unselectedLabelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        selectedItemColor: MyColors.provisionGreen,
        onTap: _onItemSelected,
      ),
    );
  }
}

class MyColors {
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
}