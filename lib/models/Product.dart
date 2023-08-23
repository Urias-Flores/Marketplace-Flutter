import 'User.dart';
import 'Category.dart';

enum State{ available, spent, notAvailable }

class Product{
  final String? id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final State state;
  final String image;
  final User user;
  final Category category;

  Product(this.id, {
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.state,
    required this.image,
    required this.category,
    required this.user,
  });

  factory Product.fromJSON(Map<String, dynamic> data){
    return Product(
      data['Document ID'] ?? '',
      name: data['Name'] ?? '',
      description: data['Description'] ?? '',
      price: data['Price'] ?? 0.0,
      discount: data['Discount'] ?? 0.0,
      state: data['State'] ?? '',
      image: data['Image'] ?? '',
      user: User.fromJSON(data['User']),
      category: Category.fromJSON(data['Category']),
    );
  }

  toJSON(){
    return {
      'Name': name,
      'Description': description,
      'Price': price,
      'Discount': discount,
      'State': state.name,
      'Image': image,
      'User': user.toJSON(),
      'Category': category.toJSON(),
    };
  }
}