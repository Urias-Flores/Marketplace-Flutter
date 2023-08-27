import 'package:Marketplace/Services/category_services.dart';
import 'package:Marketplace/models/Category.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController{
  final _isLoading = true.obs;
  final _existError = ''.obs;
  final RxList<Category> _categories = <Category>[].obs;

  final RxList _selectedImages = [].obs;
  final RxString _name = ''.obs;
  final RxString _description = ''.obs;
  final RxString _category = ''.obs;
  final RxString _price = ''.obs;
  final RxString _discount = ''.obs;

  bool get isLoading => _isLoading.value;
  set isLoading( bool value ) => _isLoading.value = value;

  String get existError => _existError.value;
  set existError( String value ) => _existError.value = value;

  List<Category> get categories => _categories.value;
  set categories(List<Category> values) => _categories.value = values;

  List get selectedImages => _selectedImages.value;
  set selectedImages(List values) => _selectedImages.value = values;

  String get name => _name.value;
  set name ( String value ) => _name.value = value;

  String get description => _description.value;
  set description ( String value ) => _description.value = value;

  String get category => _category.value;
  set category(String value) => _category.value = value;

  String get price => _price.value;
  set price ( String value ) => _price.value = value;

  String get discount => _discount.value;
  set discount ( String value ) => _discount.value = value;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future loadCategories() async {
    if(categories.isNotEmpty){
      isLoading = false;
      return;
    }

    try {
      final getCategories = await CategoryServices().getCategories();
      categories = getCategories;
      isLoading = false;
    } catch (error) {
      print('ERROR: $error');
      existError = error.toString();
      isLoading = false;
    }
  }
}