import 'dart:io';
import 'package:Marketplace/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:Marketplace/controllers/add_product_controller.dart';
import 'package:get/get.dart';

class AddImage extends StatelessWidget{
  AddImage({super.key});
  AddProductController addProductController = Get.put<AddProductController>(AddProductController());

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
            Obx( () => Row(
                children: addProductController.selectedImages.map((imagePath) =>
                    getWidgetImage(imagePath)
                ).toList()
            ),
          ),
          getButtonAdd()
        ],
      )
    );
  }

  List<Widget> getListOfImages(){
    List<Widget> listOfImages = [];
    addProductController.selectedImages.forEach((imagePath) {
      if( imagePath is String && imagePath.isNotEmpty){
        final imageWidget = getWidgetImage(imagePath);
        listOfImages.add(imageWidget);
      }
    });
    listOfImages.add(getButtonAdd());
    return listOfImages;
  }

  Widget getButtonAdd(){
    return GestureDetector(
      onTap: pickFile,
      child: Container(
        padding: EdgeInsets.only(
          right: getProportionateScreenWidth(10),
          bottom: getProportionateScreenHeight(30)
        ),
        child: SizedBox(
          width: 85,
          height: 85,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(30)),
            decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15)),
            child: SvgPicture.asset('assets/icons/add_image.svg'),
          ),
        ),
      ),
    );
  }

  Widget getWidgetImage(String path){
    return Container(
      padding: EdgeInsets.only(
          right: getProportionateScreenWidth(10),
          bottom: getProportionateScreenHeight(30)
      ),
      child: SizedBox(
        width: 85,
        height: 85,
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(0)),
          decoration: BoxDecoration(
              color: const Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(15)),
          child: Image.file(File(path)),
        ),
      ),
    );
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      final path = result.files.single.path;
      addProductController.selectedImages.add(path ?? '');

    }
  }
}