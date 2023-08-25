import 'package:Marketplace/models/Contact.dart';

class User{
  String id;
  final String email;
  final String password;
  final Contact contact;

  User(this.id, {
    required this.email,
    required this.password,
    required this.contact,
  });

  factory User.fromJSON(Map<String, dynamic> data){
    return User(
      data['Document ID'] ?? '',
      email: data['Email'] ?? '',
      password: data['Password'] ?? '',
      contact: Contact.fromJSON(data['Contact']),
    );
  }

  toJSON(){
    return {
      'Document ID': id,
      'Email': email,
      'Password': password,
      'Contact': contact.toJSON()
    };
  }
}