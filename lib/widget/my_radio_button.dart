import 'package:flutter/material.dart';

enum ProductTypeEnum { Reusable, Unneeded }

class MyRadioButton extends StatelessWidget {
  //Constructpr
  MyRadioButton({
    Key? key,
    required this.title,
    required this.value,
    required this.productTypeEnum,
    required this.onChanged,
  }) : super(key: key);

  //data members and their values
  String title;
  ProductTypeEnum value;
  ProductTypeEnum? productTypeEnum;

  //Function
  Function(ProductTypeEnum?) onChanged;

  @override
  Widget build(BuildContext context) {
    //display representation UI
    return Container(
      child: RadioListTile<ProductTypeEnum>(
          title: Text(title),
          value: ProductTypeEnum.Unneeded,
          groupValue: productTypeEnum,
          contentPadding: EdgeInsets.all(0.0),
          dense: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          tileColor: Colors.greenAccent.shade100,
          onChanged: onChanged),
    );
  }
}
