import 'package:Marketplace/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';

class FormAddProduct extends StatelessWidget{
  const FormAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              buildFormField(
                  text: 'Nombre',
                  hintText: 'Escribe la nombre del producto'),
              SizedBox(height: getProportionateScreenHeight(20)),
              buildFormField(
                  text: 'Descripcion',
                  hintText: 'Escribe la descripcion del producto'),
              SizedBox(height: getProportionateScreenHeight(20)),
              buildDropDownButton(
                  items: <String>[
                    '-- Categoria --',
                    'Phone',
                    'Car',
                  ]),
              SizedBox(height: getProportionateScreenHeight(20)),
              buildFormField(text: 'Precio', hintText: '0.00'),
              SizedBox(height: getProportionateScreenHeight(20)),
              buildFormField(text: 'Descuento', hintText: '10%'),
              SizedBox(height: getProportionateScreenHeight(20)),
              buildDropDownButton(items: <String>[
                '-- Estado del producto --',
                'Disponible',
                'Agotado',
                'No existe',
              ]),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: DefaultButton(
              text: 'Agregar',
              press: () {},
            ),
          ),
        ],
      )
    );
  }

  TextFormField buildFormField(
      {required String text, required String hintText}) {
    return TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: text,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }

  DropdownButton buildDropDownButton({required List<String> items}) {
    List<DropdownMenuItem> menuItems = items
        .map<DropdownMenuItem>(
            (item) => DropdownMenuItem(value: item, child: Text(item)))
        .toList();

    return DropdownButton(
      value: items.first,
      items: menuItems,
      onChanged: (context) {},
      isExpanded: true,
    );
  }
}