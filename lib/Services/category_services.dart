import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:Marketplace/models/Category.dart';

class CategoryServices{
  final database = FirebaseFirestore.instance;

  Future<List<Category>> getCategories() async {
    List<Category> categories = [];
    QuerySnapshot querySnapshot = await database.collection('Categories').get();
    querySnapshot.docs.forEach((doc) {
      final document = doc.data() as Map<String, dynamic>;
      document['Document ID'] = doc.id;
      Category category = Category.fromJSON(document);
      categories.add(category);
    });
    return categories;
  }
}