import 'package:flutter/material.dart';
import 'package:provisions/Login/SignUp.dart';
import 'package:provisions/Login/login.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLogin = true;

  void toggleScreens() {
    setState(() {
      showLogin= !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin){
      return Login(showSignUp: toggleScreens);
    } else {
      return SignUp(showLogin: toggleScreens);
    }
  }

}
