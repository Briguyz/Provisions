import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetEvents extends StatelessWidget {
  final String documentId;

  GetEvents({required this.documentId});

  @override
  Widget build(BuildContext context){
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            //return Text('Full Name: ${data['Name']}');
            return Text('Events: ${data['Events']}');
          }
          return Text('loading..');
        }));
  }
}