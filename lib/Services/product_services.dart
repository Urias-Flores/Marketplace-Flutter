import 'package:Marketplace/models/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final database = FirebaseFirestore.instance;
  
  Future createProduct(Product product) async {
    await database.collection('Products').add(product.toJSON())
      .whenComplete(() {
        print('Producto ingresado exitosamente');
      })
      .catchError((excep) {
        print('ERROR: $excep');
        return excep;
      });
  }

  Future<List<Product>> getProducts() async{
    List<Product> products = [];
    QuerySnapshot querySnapshot = await database.collection('products').get();
    querySnapshot.docs.forEach((doc) {
      Product product = Product.fromJSON(doc as Map<String, dynamic>);
      products.add(product);
    });
    return products;
  }

  Future<Product> getProductByID(String documentID) async {
    QuerySnapshot querySnapshot = await database.collection('Products').where('Document ID', isEqualTo: documentID).get();
    final document = querySnapshot.docs[0] as Map<String, dynamic>;
    document['Document ID'] = querySnapshot.docs[0].id;
    return Product.fromJSON(document);
  }
}