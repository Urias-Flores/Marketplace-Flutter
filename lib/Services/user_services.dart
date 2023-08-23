import 'package:Marketplace/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository{
  final database = FirebaseFirestore.instance;

  createUser(User user) async {
    await database.collection('Users').add(user.toJSON())
      .whenComplete(() {
        print('El usuario ha sido ingresado exitosamente');
      })
      .catchError((error) {
        print('ERROR: $error');
        return error;
      });
  }

  Future<List<User>> getUsers() async {
    QuerySnapshot querySnapshot = await database.collection('Users').get();
    List<User> users = [];
    querySnapshot.docs.forEach((doc) {
      User user = User.fromJSON(doc.data() as Map<String, dynamic>);
      users.add(user);
    });
    return users;
  }

  Future<User> getUserByID(String documentID) async {
    QuerySnapshot querySnapshot = await database.collection('Users').where('Document ID', isEqualTo: documentID).get();
    final document = querySnapshot.docs[0] as Map<String, dynamic>;
    document['Document ID'] = querySnapshot.docs[0].id;
    return User.fromJSON(document);
  }
}