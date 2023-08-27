import 'package:Marketplace/Services/product_services.dart';
import 'package:get/get.dart';
import 'package:Marketplace/models/Product.dart';
import 'package:Marketplace/models/User.dart';
import 'package:get_storage/get_storage.dart';

class MyProductsPageController extends GetxController{
  final _numItems = 0.obs;
  final _isLoading = true.obs;
  final _existError = ''.obs;
  final _products = <Product>[].obs;

  int get numItems => _numItems.value;
  set numItems( int value ) => _numItems.value = value;

  bool get isLoading => _isLoading.value;
  set isLoading( bool value ) => _isLoading.value = value;

  String get existError => _existError.value;
  set existError( String value ) => _existError.value = value;

  List<Product> get products => _products.value;
  set products( List<Product> value ) => _products.value = value;

  @override
  void onInit() {
    super.onInit();
    loadProductsList();
  }

  Future loadProductsList() async{
    if(products.isNotEmpty){
      isLoading = false;
      return;
    }

    try {
      final currentUser = GetStorage().read('CurrentUser') as Map<String, dynamic>;
      User user = User.fromJSON(currentUser);
      List<Product> productsList = await ProductService().getProductsByUser();
      products = productsList;
      isLoading = false;
    } catch ( error ) {
      existError = error.toString();
      isLoading = false;
    }
  }
}