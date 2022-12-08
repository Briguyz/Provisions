import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provisions/MainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provisions/Login/SignUp.dart';

import 'dart:io';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final VoidCallback showSignUp;
  const Login({Key? key, required this.showSignUp}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final databaseReference = FirebaseFirestore.instance.collection('Users');

  FirebaseAuth auth = FirebaseAuth.instance;


  //Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim()
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  /*
  //Future<bool> getUser() async{
  bool getUser() {
    /*DocumentSnapshot data = await retrieveData();
    print(data.data().toString());
    return false;*/


      databaseReference.doc(_emailController.text.toString())
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          print('Document exists on the database');
          return true;
        }
      });
      return false;
  }
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //Icon or Picture
                  Image.asset('assets/images/a-logo.png',
                  ),

                    SizedBox(height: 40),

                    //Email textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email_outlined,
                                color: Color(0xFF388E3C)
                              ),
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    //Password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.vpn_key,
                                color: Color(0xFF388E3C),
                              ),
                              border: InputBorder.none,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    //Sign in Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: signIn,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    //Registration Option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Not a member?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            )
                        ),
                        GestureDetector(
                          onTap: widget.showSignUp,
                          child: Text(
                              ' Register now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        )
    );
  }
}
