import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provisions/login.dart';
import 'package:provisions/main.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => ProfileSetupState();
} //MyHomePage

class ProfileSetupState extends State<ProfileSetup> {
  //Text controllers
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _btnActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Setup'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
              Icon(Icons.android,
                size: 100,
              ),

              //Message
              Text(
                  'Create Account',
                  style: GoogleFonts.abel(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )
              ),
              SizedBox(height: 50),

              //First Name
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
                      controller: _firstnameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'First Name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),


              //Last Name
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
                      controller: _lastnameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Last Name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),


              //Email
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
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),


              //Password
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
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),


              //Sign up Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(/*
                  onTap: _firstnameController.text.length > 1 && _lastnameController.text.length > 1 && _emailController.text.length > 1 && _passwordController.text.length > 1
                    ?() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MainPage(title: 'Provisions')));
                    } : null,*/
                    //pushReplacement(MaterialPageRoute(builder: (BuildContext) => Provisions()));

                  onTap: () {
                    setState(() {
                      if (_firstnameController.text.isEmpty || _lastnameController.text.isEmpty || _emailController.text.isEmpty || _passwordController.text.isEmpty) {
                        //Do nothing, maybe alert later?
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MainPage(title: 'Provisions')));
                      }
                    });
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

            ],
          ),
        ),
      )
    );
  }
}