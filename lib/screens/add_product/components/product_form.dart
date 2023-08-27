import 'package:Marketplace/components/top_rounded_container.dart';
import 'package:Marketplace/screens/add_product/components/add_image.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/size_config.dart';
import 'package:Marketplace/Services/category_services.dart';
import 'package:Marketplace/models/Category.dart';
import 'package:Marketplace/components/default_button.dart';
import 'package:Marketplace/controllers/add_product_controller.dart';
import 'package:get/get.dart';

class FormAddProduct extends StatelessWidget{
  const FormAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddImage(),
              buildFormField(
                  text: 'Nombre',
                  hintText: 'Escribe la nombre del producto'
              ),
              buildFormField(
                  text: 'Descripcion',
                  hintText: 'Escribe la descripcion del producto'
              ),
              getCategoryDropDownList(),
              buildFormField(text: 'Precio', hintText: '0.00'),
              buildFormField(text: 'Descuento', hintText: '10%'),
            ],
          ),
        ],
      )
    );
  }

  Widget buildFormField({required String text, required String hintText}) {
    return Column(
      children: [
        TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            labelText: text,
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          )
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }

  Widget getCategoryDropDownList() {
    CategoryServices categoryServices = CategoryServices();
    final addProductController = Get.put<AddProductController>(AddProductController());
    return FutureBuilder(
      future: categoryServices.getCategories(),
      builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return const Center(
            child: Text('Sin conexion a internet'),
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<DropdownMenuItem> menuItems = [];
        menuItems.add(const DropdownMenuItem(value: '', child: Text('-- Seleccione una categoria --')));

        for(int i = 0; i < snapshot.data!.length; i++){
          Category category = snapshot.data![i];
          final dropDownMenuItem = DropdownMenuItem(value: category.id, child: Text(category.name));
          menuItems.add(dropDownMenuItem);
        }

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx( () => DropdownButton(
                value: addProductController.selectedValue,
                items: menuItems,
                onChanged: (value) {
                  addProductController.selectedValue = value;
                },
                isExpanded: true,
              )),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
          ],
        );
      }
    );
  }
}