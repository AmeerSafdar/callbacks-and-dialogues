// ignore_for_file: sized_box_for_whitespace, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:task5/presentation_layer/widget/text_widgets.dart';
class ButtonWidget extends StatelessWidget {
  String btn_txt;
  VoidCallback pressed;
  ButtonWidget({
    Key? key,
    required this.btn_txt,
    required this.pressed

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-30,
      child: ElevatedButton(
      onPressed: ()=> Future.delayed(Duration.zero,pressed), 
      child:TextsWidget(txt: btn_txt)),
    );
  }
}