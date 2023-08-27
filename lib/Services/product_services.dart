import 'package:Marketplace/Services/image_services.dart';
import 'package:Marketplace/models/Product.dart';
import 'package:Marketplace/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Marketplace/models/Category.dart';
import 'package:get_storage/get_storage.dart';

class ProductService {
  final database = FirebaseFirestore.instance;
  
  Future<Product> createProduct(Product product) async {
    Map<String, dynamic> productToLoad = product.toJSON();

    //Upload images
    ImageServices imageServices = ImageServices();
    List<Future<String>> images = product.image.map((path) async {
      return await imageServices.uploadImage(path: path);
    }).toList();
    List<String> imagesLoaded = await Future.wait(images);
    productToLoad['Images'] = imagesLoaded;

    //Getting references
    productToLoad['User'] = database.collection('Users').doc(product.user.id);
    productToLoad['Category'] = database.collection('Categories').doc(product.category.id);

    try {
      final result = await database.collection('Products').add(productToLoad);
      product.id = result.id;
      return product;
    } catch (error) {
      print('ERROR: $error');
      return product;
    }
  }

  Future<List<Product>> getProducts() async{
      QuerySnapshot querySnapshot = await database.collection('Products').get();
      List<Future<Product>> productFutures = querySnapshot.docs.map((doc) async {
        final document = doc.data() as Map<String, dynamic>;
        document['Document ID'] = doc.id;

        // Getting user
        DocumentSnapshot userSnapshot = await doc['User'].get();
        document['User'] = User.fromJSON(userSnapshot.data() as Map<String, dynamic>);

        // Getting category
        DocumentSnapshot categorySnapshot = await doc['Category'].get();
        document['Category'] = Category.fromJSON(categorySnapshot.data() as Map<String, dynamic>);

        Product product = Product.fromJSON(document);
        return product;
      }).toList();

      List<Product> products = await Future.wait(productFutures);
      return products;
  }

  Future<List<Product>> getProductsByUser() async {
    final user = await GetStorage().read('CurrentUser') as Map<String, dynamic>;
    User userInstance = User.fromJSON(user);
    DocumentReference userReference = database.collection('Users').doc(userInstance.id);

    QuerySnapshot querySnapshot = await database.collection('Products').where('User', isEqualTo: userReference).get();
    List<Future<Product>> productFutures = querySnapshot.docs.map((doc) async {
      final document = doc.data() as Map<String, dynamic>;
      document['Document ID'] = doc.id;

      // Getting user
      DocumentSnapshot userSnapshot = await doc['User'].get();
      document['User'] = User.fromJSON(userSnapshot.data() as Map<String, dynamic>);

      // Getting category
      DocumentSnapshot categorySnapshot = await doc['Category'].get();
      document['Category'] = Category.fromJSON(categorySnapshot.data() as Map<String, dynamic>);

      Product product = Product.fromJSON(document);
      return product;
    }).toList();

    List<Product> products = await Future.wait(productFutures);
    return products;
  }

  Future<Product> getProductByID(String documentID) async {
    DocumentSnapshot productSnapshot = await database.collection('Products').doc(documentID).get();
    final document = productSnapshot as Map<String, dynamic>;
    document['Document ID'] = productSnapshot.id;
    return Product.fromJSON(document);
  }

  Future<List<Product>> getProductsByName(String name) async {
    try {
      List<Product> products = await getProducts();
      products = products.where((product) => product.name.toLowerCase().contains(name.toLowerCase())).toList();
      return products;
    } catch (error) {
      print('ERROR: $error');
      return [];
    }
  }
}