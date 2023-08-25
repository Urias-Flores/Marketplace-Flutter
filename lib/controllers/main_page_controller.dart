import 'package:Marketplace/Services/category_services.dart';
import 'package:Marketplace/Services/product_services.dart';
import 'package:Marketplace/models/Product.dart';
import 'package:Marketplace/models/Category.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController{
  final _isCategoriesLoading = true.obs;
  final _isProductsLoading = true.obs;
  final _existErrorCategories = ''.obs;
  final _existErrorProducts = ''.obs;
  final _categories = <Category>[].obs;
  final _products = <Product>[].obs;

  bool get isCategoriesLoading => _isCategoriesLoading.value;
  set isCategoriesLoading( bool value ) => _isCategoriesLoading.value = value;

  bool get isProductsLoading => _isProductsLoading.value;
  set isProductsLoading( bool value ) => _isProductsLoading.value = value;

  String get existErrorCategories => _existErrorCategories.value;
  set existErrorCategories( String value ) => _existErrorCategories.value = value;

  String get existErrorProducts => _existErrorProducts.value;
  set existErrorProducts( String value ) => _existErrorProducts.value = value;

  List<Category> get categories => _categories.value;
  set categories ( List<Category> value ) => _categories.value = value;

  List<Product> get products => _products.value;
  set products ( List<Product> value ) => _products.value = value;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
    loadProducts();
  }

  Future loadCategories() async {
    if(categories.isNotEmpty){
      isCategoriesLoading = false;
      return;
    }

    try{
      categories = await CategoryServices().getCategories();
      isCategoriesLoading = false;
    } catch (error) {
      existErrorCategories = error.toString();
      isCategoriesLoading = false;
    }
  }

  Future loadProducts() async {
    if(products.isNotEmpty){
      isProductsLoading = false;
      return;
    }

    try{
      products = await ProductService().getProducts();
      isProductsLoading = false;
    } catch (error) {
      existErrorCategories = error.toString();
      isProductsLoading = false;
    }
  }
}