import 'package:Marketplace/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserServices{
  final database = FirebaseFirestore.instance;

  Future<User> createUser(User user) async {
    try {
      DocumentReference docRef = await database.collection('Users').add(user.toJSON());
      user.id = docRef.id;
      return user;
    } catch (error) {
      return user;
    }
  }

  Future<List<User>> getUsers() async {
    QuerySnapshot querySnapshot = await database.collection('Users').get();
    List<User> users = [];
    querySnapshot.docs.forEach((doc) {
      final document = doc.data() as Map<String, dynamic>;
      document['Document ID'] = doc.id;
      User user = User.fromJSON(document);
      users.add(user);
    });
    return users;
  }

  Future<User> getUserByID(String documentID) async {
    DocumentSnapshot documentSnapshot = await database.collection('Users').doc(documentID).get();
    final document = documentSnapshot.data() as Map<String, dynamic>;
    document['Document ID'] = documentSnapshot.id;
    return User.fromJSON(document);
  }

  Future<User?> getUserByEmail(String email) async {
    QuerySnapshot querySnapshot = await database.collection('Users').where('Email', isEqualTo: email).get();
    if(querySnapshot.docs.isNotEmpty){
      final document = querySnapshot.docs[0].data() as Map<String, dynamic>;
      document['Document ID'] = querySnapshot.docs[0].id;
      return User.fromJSON(document);
    }
    return null;
  }
}