import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provisions/GetName.dart';
import 'package:provisions/GetEmail.dart';
import 'package:provisions/GetEvents.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();

}

class ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth auth = FirebaseAuth.instance;

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
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.fromLTRB(0,0,10,0),
        //     child: GestureDetector(
        //       onTap: () {
        //         FirebaseAuth.instance.signOut();
        //       },
        //       child: Icon(Icons.logout_outlined, shadows: <Shadow>[Shadow(color: Colors.black45, blurRadius: 20.0, offset: Offset(0, 2.0))],),
        //     ),
        //   )
        // ],
      ),
      backgroundColor: Color(0xFFf4f4f0),
      //extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/pic.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: GetUserName(documentId: auth.currentUser!.uid),
                subtitle: Text("Your Name"),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: GetEmail(documentId: auth.currentUser!.uid),
                subtitle: Text("Your Email"),
                leading: Icon(Icons.email),
              ),
              ListTile(
                title: Text("Events"),//GetEvents(documentId: auth.currentUser!.uid),
                subtitle: Text("Your Events"),
                leading: Icon(Icons.event),
              ),
              ListTile(
                title: Text("Settings"),//GetEvents(documentId: auth.currentUser!.uid),
                subtitle: Text("Editable Settings"),
                leading: Icon(Icons.settings),
              ),
              ListTile(
                title: Text("Logout"),//GetEvents(documentId: auth.currentUser!.uid),
                //subtitle: Text("Editable Settings"),
                leading: Icon(Icons.logout),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
