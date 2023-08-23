import 'package:Marketplace/models/Contact.dart';

class User{
  final String? id;
  final String name;
  final String password;
  final Contact contact;

  User(this.id, {
    required this.name,
    required this.password,
    required this.contact,
  });

  factory User.fromJSON(Map<String, dynamic> data){
    return User(
      data['DocumentID'] ?? '',
      name: data['Name'] ?? '',
      password: data['Password'] ?? '',
      contact: Contact.fromJSON(data['Contact']),
    );
  }

  toJSON(){
    return {
      'Name': name,
      'Password': password,
      'Contact': contact.toJSON()
    };
  }
}