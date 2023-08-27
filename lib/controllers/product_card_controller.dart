import 'package:get/get.dart';

class ProductCardController extends GetxController{
  final _selectedImage = 0.obs;

  int get selectedImage => _selectedImage.value;
  set selectedImage(int value) => _selectedImage.value = value;
}