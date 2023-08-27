import 'package:get/get.dart';

class AddProductController extends GetxController{
  final RxString _selectedValue = ''.obs;
  final RxList _selectedImages = [].obs;

  String get selectedValue => _selectedValue.value;
  set selectedValue(String value) => _selectedValue.value = value;

  List get selectedImages => _selectedImages.value;
  set selectedImages(List values) => _selectedImages.value = values;
}