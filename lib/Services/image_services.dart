import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';

class ImageServices{
  final storage = FirebaseStorage.instance;

  Future<String> uploadImage({ required String path }) async {
    final name = generateRandomString(20);
    final extension = path.split('.')[1];
    final imageRef = storage.ref().child('$name.$extension');
    File file = File(path);

    try{
      UploadTask uploadTask = imageRef.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      String downloadURL = await taskSnapshot.ref.getDownloadURL();

      return downloadURL;
    } on FirebaseException catch(error) {
      print('ERROR: $error');
      return '';
    }
  }

  String generateRandomString(int length) {
    const chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    final random = Random();
    final codeUnits = List.generate(length, (index) {
      return chars.codeUnitAt(random.nextInt(chars.length));
    });
    return String.fromCharCodes(codeUnits);
  }
}