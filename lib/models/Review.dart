import 'package:Marketplace/models/Product.dart';
import 'package:Marketplace/models/User.dart';

class Review{
  final String? id;
  final User user;
  final Product product;
  final int rating;

  Review( this.id, {
    required this.user,
    required this.product,
    required this.rating
  });

  factory Review.fromJSON(Map<String, dynamic> data){
    return Review(
      data['Document ID'] ?? '',
      user: User.fromJSON(data['User']),
      product: Product.fromJSON(data['Products']),
      rating: data['Rating']
    );
  }

  toJSON(){
    return {
      'User': user.toJSON(),
      'Product': product.toJSON(),
      'Rating': rating,
    };
  }
}