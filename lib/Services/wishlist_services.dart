import 'package:Marketplace/models/WishList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WishListServices{
  final database = FirebaseFirestore.instance;

  createWishList(){

  }

  Future<List<WishList>> getWishListByUser(String user) async{
    List<WishList> wishlist = [];
    QuerySnapshot querySnapshot = await database.collection('WishList').where('User', isEqualTo: user).get();

    return wishlist;
  }
}