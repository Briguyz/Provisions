import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';



class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();

}

class ProfilePageState extends State<ProfilePage> {
  //final databaseReference = FirebaseFirestore.instance.collection('Users');
  final user = FirebaseAuth.instance.currentUser;
  final databaseReference = FirebaseFirestore.instance.collection('Users');


  Future<void> getUser() async {
    DocumentSnapshot data = await retrieveData();
    print(data.data().toString());
  }

  Future<DocumentSnapshot> retrieveData() async{
    return databaseReference.doc(user?.uid).get();
  }

  Future<void> readData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  @override
  Widget build(BuildContext context){
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          //Check padding
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: 120, height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(image: AssetImage('a-logo.png'))
                ),
              ),

              const SizedBox(height: 10),

              Text()
            ],
          ),
        ),
      )
    );
  }

}


/*
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
} //MyProfilePage

class ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

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
      body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Signed in as: ' + user.email!),
        MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.green,
            child: Text('Sign Out')
        )

      ],
    )
    ),
    );
  }
}

 */