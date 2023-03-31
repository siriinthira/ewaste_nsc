import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:app/widget/my_radio_button.dart';

class ItemDetails {
  final int item_id;
  final String item_name;
  final String item_desc;
  final int amount;
  // late String proudctDes;
  // late Int amount;
  // late bool checkBox;
  // late ProductTypeEnum aboutProduct;
  final String ewtype_id;

  ItemDetails(
      {required this.item_id,
      required this.item_name,
      required this.item_desc,
      required this.amount,
      required this.ewtype_id}); //constructor
}
