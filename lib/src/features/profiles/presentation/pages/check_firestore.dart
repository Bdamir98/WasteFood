import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class CheckFirestore extends StatelessWidget {
   CheckFirestore({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserUID = FirebaseAuth.instance.currentUser!.uid;
    final usersQuery = FirebaseFirestore.instance.collection('Posts').where('id',isEqualTo: currentUserUID);
    return FirestoreListView<Map<String, dynamic>>(
  query: usersQuery,
  itemBuilder: (context, snapshot) {
    Map<String, dynamic> user = snapshot.data();

    return Text('User name is ${user['city']}');
  },
);
  }
}