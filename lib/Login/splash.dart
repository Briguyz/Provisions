import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provisions/MainPage.dart';
import 'package:provisions/input_theme.dart';
import 'package:material_color_gen/material_color_gen.dart';


void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => MainPage()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(context);
  }

  Widget ScreenWidget(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Color(0xFF388E3C).toMaterialColor(),
        inputDecorationTheme: InputTheme().theme(),
      ),
      home: Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: new Color(0xFF388E3C),
                gradient: LinearGradient(colors: [(new  Color(0xFF388E3C)), new Color(0xFFFFF9C4)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          Center(
            child: Container(
              child: Image.asset('assets/images/a-logo.png')
            ),
          )
        ],
      ),
    )
    );
  }
}

//   Widget ScreenWidget(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: new Color(0xFF388E3C),
//                 gradient: LinearGradient(colors: [(new  Color(0xFF388E3C)), new Color(0xFFFFF9C4)],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter
//                 )
//             ),
//           ),
//           Center(
//             child: Container(
//               child: Image.asset('assets/images/a-logo.png')
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }