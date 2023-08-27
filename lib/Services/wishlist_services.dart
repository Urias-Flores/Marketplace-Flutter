import 'package:Marketplace/models/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Marketplace/models/User.dart';
import 'package:Marketplace/models/WishList.dart';
import 'package:Marketplace/models/Category.dart';
import 'package:get_storage/get_storage.dart';

class WishListServices{
  final database = FirebaseFirestore.instance;

  Future<WishList> createWishList(WishList wishList) async {
    try {
      DocumentReference userReference = database.collection('User').doc(wishList.user.id);
      final wishListInstance = {
        'User': userReference,
        'Products': []
      };
      DocumentReference newWishList = await database.collection('WishList').add(wishListInstance);
      wishList.id = newWishList.id;
      return wishList;
    } catch ( error ) {
      print('ERROR: $error');
      return wishList;
    }
  }

  Future updateProductsInWishList({ required String product, String option = 'ADD' }) async {
    final user = await GetStorage().read('CurrentUser') as Map<String, dynamic>;
    User userInstance = User.fromJSON(user);
    DocumentReference userReference = database.collection('User').doc(userInstance.id);
    try {
      QuerySnapshot wishListsSnapshot = await database.collection('WishList').where('User', isEqualTo: userReference).get();
      if(wishListsSnapshot.docs.isNotEmpty){
        final wishListID = wishListsSnapshot.docs[0].id;
        DocumentReference wishListReference = database.collection('WishList').doc(wishListID);
        DocumentReference productReference = database.collection('Products').doc(product);

        wishListReference.set({
          'Products': option == 'DELETE'
              ? FieldValue.arrayRemove([productReference])
              : FieldValue.arrayUnion([productReference])
        }, SetOptions(merge: true));
      }
    } catch (error) {
      print('ERROR: $error');
      return;
    }
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

  Future<bool> getExistInWishList({ required String productID }) async {
    final user = await GetStorage().read('CurrentUser') as Map<String, dynamic>;
    User userInstance = User.fromJSON(user);
    DocumentReference userReference = database.collection('Users').doc(userInstance.id);

    QuerySnapshot wishListSnapshot = await database.collection('WishList').where('', isEqualTo: userReference).get();
    if(wishListSnapshot.docs.isNotEmpty){
      final wishList = wishListSnapshot.docs[0].data() as Map<String, dynamic>;
      List<DocumentReference> productsRef = List.castFrom(wishList['Products']);
      for (var productReference in productsRef) {
        DocumentSnapshot productSnapshot = await productReference.get();
        if(productSnapshot.id == productID){
          return true;
        }
      }
    }
    return false;
  }
}