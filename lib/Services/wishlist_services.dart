import 'package:Marketplace/models/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Marketplace/models/WishList.dart';
import 'package:Marketplace/models/User.dart';
import 'package:Marketplace/models/Category.dart';

class WishListServices{
  final database = FirebaseFirestore.instance;

  createWishList(){

  }

  Future<WishList?> getWishListByUser({ required String userID }) async{
    DocumentReference userReference = database.collection('Users').doc(userID);
    QuerySnapshot querySnapshot = await database.collection('WishList').where('User', isEqualTo: userReference).get();
    if(querySnapshot.docs.isNotEmpty){
      DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
      final document = documentSnapshot.data() as Map<String, dynamic>;
      document['Document ID'] = querySnapshot.docs[0].id;

      //Getting User
      DocumentSnapshot userSnapshot = await documentSnapshot['User'].get();
      document['User'] = User.fromJSON(userSnapshot.data() as Map<String, dynamic>);

      //Getting Products
      List<DocumentReference> productsRef = List.castFrom(document['Products']);
      List<Future<Product>> productsSnapshot = productsRef.map((productRef) async {
        DocumentSnapshot productSnapshot = await productRef.get();
        final productDocument = productSnapshot.data() as Map<String, dynamic>;

        //Setting user
        productDocument['User'] = document['User'];

        //getting category
        DocumentSnapshot categorySnapshot = await productSnapshot['Category'].get();
        productDocument['Category'] = Category.fromJSON(categorySnapshot.data() as Map<String, dynamic>);

        Product product = Product.fromJSON(productDocument);
        return product;
      }).toList();

      List<Product> newProducts = await Future.wait(productsSnapshot);
      document['Products'] = newProducts;

      WishList wishList = WishList.fromJSON(document);
      return wishList;
    }
    return null;
  }
}