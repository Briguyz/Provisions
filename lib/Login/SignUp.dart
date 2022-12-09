import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_gen/material_color_gen.dart';

import 'package:provisions/Login/login.dart';
import 'package:provisions/MainPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provisions/string_extension.dart';
import 'package:flutter/services.dart';



import '../input_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final VoidCallback showLogin;
  const SignUp({Key? key, required this.showLogin}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var _formKey = GlobalKey<FormState>();
  // final createUser = FirebaseFirestore.instance.collection('Users');
  // final createAuth = FirebaseAuth.instance;

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  //Text controllers
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _fullnameController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
  //signUp(){
    //Creates User with Email and Password
    var Favorites = <String>[];
    var Events = <String>[];

    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim()
    );

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
        'Name': _fullnameController.text.trim(),
        'Email': _emailController.text.trim(),
        'Events': Events,
        'Favorites': Favorites,
    });

    //   await FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid).set({
  //     firstName: firstName,
  //     lastName: lastName,
  //     birthday: birthday,
  //     email: email
  //   })
  // })
    // FirebaseFirestore.instance.collection("Users").add({
    //   'Name': _fullnameController.text.trim(),
    //   'Email': _emailController.text.trim(),
    //   'Events': Events,
    //   'Favorites': Favorites,
    // });
  //   FirebaseAuth.instance.createUserWithEmailAndPassword(email, password)
  //       .then(() => {
  //   //Once the user creation has happened successfully, we can add the currentUser into firestore
  //   //with the appropriate details.
  //   firebase.firestore().collection('users').doc(firebase.auth().currentUser.uid)
  //       .set({
  //   firstName: firstName,
  //   lastName: lastName,
  //   birthday: birthday,
  //   email: email
  //   })
  //       //ensure we catch any errors at this stage to advise us if something does go wrong
  //       .catch(error => {
  //       console.log('Something went wrong with added user to firestore: ', error);
  //       })
  // })
  //   //we need to catch the whole sign up process if it fails too.
  //       .catch(error => {
  //   console.log('Something went wrong with sign up: ', error);
  //   }
  }
    //   await createAuth.createUserWithEmailAndPassword(
    //       email: _emailController.text.trim(),
    //       password: _passwordController.text.trim(),
    //
    //   );
    //
    // await FirebaseFirestore.instance.collection("Users").add({
    //   'Name': _fullnameController.text.trim(),
    //   'Email': _emailController.text.trim(),
    //   'Events': Events,
    //   'Favorites': Favorites,
    // });

  //}

    // Future<void> signUp() async {
    //   //Creates User with Email and Password
    //   var Favorites = <String>[];
    //   var Events = <String>[];
    //
    //   await FirebaseFirestore.instance.collection("Users").add({
    //       'Name': _fullnameController.text.trim(),
    //       'Email': _emailController.text.trim(),
    //       'Events': Events,
    //       'Favorites': Favorites,
    //   });
    //
    //   }


      //   await createAuth.createUserWithEmailAndPassword(
    //       email: _emailController.text.trim(),
    //       password: _passwordController.text.trim());
    //
    //   //Adds User information into database collection('User')
    //   addUserDetails(
    //       _fullnameController.text.trim(),
    //       _emailController.text.trim()
    //   );
    // }
    //
    // Future<void> addUserDetails(String full_name, String email) async {
    // var Favorites = <String>[];
    // var Events = <String>[];
    //
    // createAuth
    //
    // await createUser.add({
    //   'Name': full_name,
    //   'Email': email,
    //   'Events': Events,
    //   'Favorites': Favorites,
    // });


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,//Color(0xFF388E3C).toMaterialColor(),
        inputDecorationTheme: InputTheme().theme(),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],

        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/a-logo.png',
                  scale: 12,
                ),
              ],
            )
        ),
        body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This is a required field";
                        }
                          return null;
                        },
                      controller: _fullnameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        helperText: "",
                        hintText: "John Smith",
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                      validator: (value){
                      if(value == null || value.isEmpty){
                        return "This is a required field";
                      }
                      if(!EmailValidator.validate(value)){
                        return "Enter a valid email";
                      }
                        return null;
                      },
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        helperText: "",
                        hintText: "email@domain.com"
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "This is a required field";
                          }
                          if(value.length < 6){
                            return "The Password is too short";
                          }
                            return null;
                        },
                        controller: _passwordController,
                        obscureText: obscurePassword,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: "Password",
                          helperText: "",
                          suffixIcon: IconButton(
                            onPressed: () => setState(() => obscurePassword = !obscurePassword),
                            icon: Icon(
                              obscurePassword ? Icons.visibility :Icons.visibility_off,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      )
                    ),

                    SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "This is a required field";
                          }
                          if(_passwordController.text != value){
                            return "Passwords must match";
                          }
                            return null;
                        },
                        controller: _confirmpasswordController,
                        obscureText: obscureConfirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: "Confirm Text",
                          helperText: "",
                          suffixIcon: IconButton(
                            onPressed: () => setState(() => obscureConfirmPassword = !obscureConfirmPassword),
                            icon: Icon(
                              obscureConfirmPassword ? Icons.visibility :Icons.visibility_off,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    //Sign up Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            print("Form is valid");
                            signUp();
                            }
                          else{
                            print("Form is NOT valid");
                          }
                        },
                      child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                            'Sign Up',
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Already a Member?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        )
                    ),
                    GestureDetector(
                      onTap: widget.showLogin,
                      child: Text(
                          ' Login Now!',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    )
                  ],
                )

                  ],
                ),
              ),
            ),
      ),
    );
  }
}