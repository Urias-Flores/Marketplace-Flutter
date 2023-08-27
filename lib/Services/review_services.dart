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

  Future<double> getReviewByProduct({ required String product }) async {
    DocumentReference productReference = database.collection('Products').doc(product);
    QuerySnapshot reviewSnapshot = await database.collection('Review').where('Product', isEqualTo: productReference ).get();
    double sumRating = 0;
    int counter = 0;
    for (var doc in reviewSnapshot.docs) {
      final review = doc.data() as Map<String, dynamic>;
      sumRating+= double.parse(review['Rating']);
      counter++;
    }
    return sumRating / counter;
  }
}