import 'package:Marketplace/models/Product.dart';
import 'package:Marketplace/models/User.dart';

class WishList{
  final String? id;
  final User user;
  final List<Product> products;

  WishList( this.id, {
    required this.user,
    required this.products
  });

  factory WishList.fromJSON(Map<String, dynamic> data){

    return WishList(
        data['Document ID'] ?? '',
        user: data['User'] ?? '',
        products: data['Products'] ?? []
    );
  }

  toJSON(){
    final productIDs = products.map((product) => product.id).toList();
    return {
      'User': user.id,
      'Products': productIDs
    };
  }
}