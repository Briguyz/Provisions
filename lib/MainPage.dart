import 'package:flutter/material.dart';

import 'package:provisions/Pages/favorites.dart';
import 'package:provisions/Pages/maps.dart';
import 'package:provisions/Pages/profile.dart';
import 'package:provisions/index.dart';
import 'package:provisions/Login/login.dart';
import 'package:provisions/Login/auth.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:provisions/input_theme.dart';

class MainPage extends StatelessWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext content) {
    return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return IndexPage();
            }
            else {
              return AuthPage();
            }
          },
        )
    );
  }
}


      /*
    );
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return IndexPage();
              } else {
                return AuthPage();
              }
            }
        )
    );
  }
}

       */
/*
class MainPage extends StatelessWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext content){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return IndexPage();
          } else {
            return AuthPage();
          }
        }
      )
    );
  }
}

 */



/*
class MainPage extends StatefulWidget {
  //const MainPage({super.key, required this.title});
  //const MainPage({super.key});
  const MainPage({Key? key}) : super(key: key);

  //final String title = "MainPage";
  //final String title;

  @override
  State<MainPage> createState() => MainPageState();
} //MyHomePage


class MainPageState extends State<MainPage> {
  // _tappedIndex is an integer that changes according to bottomNavigationBar icon that is clicked.
  // pages[] is used in conjunction with _tappedIndex to navigate through the application's routes in the body.
  int _tappedIndex = 0;
  final pages = [
    HomePage(),
    MapsPage(),
    EventsPage(),
    FavoritesPage(),
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
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_purple500_rounded),
            label: 'Favorites',

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
        //style: TextStyle(color: Colors.white),
        automaticallyImplyLeading: false,

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
*/
