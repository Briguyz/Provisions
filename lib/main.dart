import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provisions/blocs/application_bloc.dart';
import 'package:provisions/favorites.dart';

import 'package:provisions/home.dart';
import 'package:provisions/maps.dart';
import 'package:provisions/events.dart';
import 'login.dart';
//import 'package:firebase_core/firebase_core.dart';

/* ONCE FIREBASE CONNECTION WORKS
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}*/


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)  => ApplicationBloc(),
      child: MaterialApp(
        title: 'Provisions',
        theme: ThemeData(
          primarySwatch: MyColors.provisionGreen,
        ),
        home: LoginPage(),
        //home: const MainPage(title: 'Provisions'),
      )
    );
  }
}


class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

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

