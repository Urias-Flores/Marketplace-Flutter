import 'package:Marketplace/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class ReviewServices{
  final database = FirebaseFirestore.instance;

  Future addRewiew(String product, double rating) async {
    final user = await GetStorage().read('CurrentUser') as Map<String, dynamic>;
    User userInstance = User.fromJSON(user);
    DocumentReference userReference = database.collection('Users').doc(userInstance.id);
    DocumentReference productReference = database.collection('Products').doc(product);
    final review = {
      'User': userReference,
      'Product': productReference,
      'Rating': rating,
    };
    try {
      await database.collection('Reviews').add(review);
    } catch (error) {
      print(error);
      return;
    }
  }

  Future<double> getReviewByProduct({ required String product }) async {
    DocumentReference productReference = database.collection('Products').doc(product);
    QuerySnapshot reviewSnapshot = await database.collection('Review').where('Product', isEqualTo: productReference ).get();
    double sumRating = 0;
    int counter = 0;

    if(reviewSnapshot.docs.isEmpty){
      return 0.0;
    }

    for (var doc in reviewSnapshot.docs) {
      final review = doc.data() as Map<String, dynamic>;
      sumRating+= double.parse(review['Rating']);
      counter++;
    }
    return sumRating / counter;
  }
}