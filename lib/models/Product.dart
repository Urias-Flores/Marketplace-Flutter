import 'User.dart';
import 'Category.dart';

enum State{ available, spent, notAvailable, noData }

Map<String, State> toState = {
  '': State.noData,
  'available': State.available,
  'spent': State.spent,
  'notAvailable': State.notAvailable,
};

class Product{
  final String? id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final State? state;
  final List<dynamic> image;
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
      price: data['Price'].toDouble(),
      discount: data['Discount'].toDouble(),
      state: toState[data['State']],
      image: data['Images'] as List<dynamic> ?? [],
      user: data['User'],
      category: data['Category'],
    );
  }

  toJSON(){
    return {
      'Name': name,
      'Description': description,
      'Price': price,
      'Discount': discount,
      'State': state.toString(),
      'Image': image,
      'User': user.toJSON(),
      'Category': category.toJSON(),
    };
  }
}