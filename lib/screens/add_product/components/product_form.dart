import 'package:Marketplace/screens/add_product/components/add_image.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/size_config.dart';
import 'package:Marketplace/models/Category.dart';
import 'package:Marketplace/controllers/add_product_controller.dart';
import 'package:get/get.dart';

class FormAddProduct extends StatelessWidget{
  FormAddProduct({super.key});
  final addProductController = Get.put<AddProductController>(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddImage(),
              buildNameField(),
              buildDescriptionField(),
              getCategoryDropDownList(),
              buildPriceField(),
              buildDiscountField(),
            ],
          ),
        ],
      )
    );
  }

  Widget buildNameField() {
    return Column(
      children: [
        TextFormField(
          onChanged: (String value) {
            addProductController.name = value;
          },
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelText: 'Nombre',
            hintText: 'Escribe un nombre para el producto',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          )
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }

  Widget buildDescriptionField() {
    return Column(
      children: [
        TextFormField(
            onChanged: (String value) {
              addProductController.description = value;
            },
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Descripción',
              hintText: 'Escribe una descripcion para el producto',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            )
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }

  Widget buildPriceField() {
    return Column(
      children: [
        TextFormField(
            onChanged: (String value) {
              addProductController.price = value;
            },
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Precio',
              hintText: '0.00',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            )
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }

  Widget buildDiscountField() {
    return Column(
      children: [
        TextFormField(
            onChanged: (String value) {
              addProductController.discount = value;
            },
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: 'Descuento',
              hintText: '10%',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            )
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }

  Widget getCategoryDropDownList() {
    return Obx(() {
        if(addProductController.isLoading){
          return const Center( child: CircularProgressIndicator() );
        } else if(addProductController.existError.isNotEmpty){
          return Center( child: Text(addProductController.existError) );
        } else {
          List<DropdownMenuItem> menuItems = [];
          menuItems.add(const DropdownMenuItem(value: '', child: Text('-- Seleccione una categoria --')));

          for(int i = 0; i < addProductController.categories.length; i++){
            Category category = addProductController.categories[i];
            final dropDownMenuItem = DropdownMenuItem(value: category.id, child: Text(category.name));
            menuItems.add(dropDownMenuItem);
          }

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx( () => DropdownButton(
                  value: addProductController.category,
                  items: menuItems,
                  onChanged: (value) {
                    addProductController.category = value;
                  },
                  isExpanded: true,
                )),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          );
        }
      }
    );
  }
}