import 'package:Marketplace/models/Review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewServices{
  final database = FirebaseFirestore.instance;

  createReview(Review review) async {
    await database.collection('Review').add(review.toJSON())
      .whenComplete(() {
        print('Review agregado exitosamente');
      })
      .catchError((error) {
        print('ERROR: $error');
        return error;
      });
  }

  Future<List<Review>> getReviewByProduct(String product) async {
    //Product of type document: djSJOC892jskj
    List<Review> reviews = [];
    QuerySnapshot result = await database.collection('Review').where('Product', isEqualTo: product ).get();
    result.docs.forEach((doc) {
      final document = doc.data() as Map<String, dynamic>;
      document['Document ID'] = doc.id;
      Review review = Review.fromJSON(document);
      reviews.add(review);
    });
    return reviews;
  }
}