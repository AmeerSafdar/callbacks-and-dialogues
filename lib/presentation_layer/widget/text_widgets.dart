// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
class TextsWidget extends StatelessWidget {
  TextsWidget({super.key,required this.txt});
  String txt;

  @override
  Widget build(BuildContext context) {
    return Text(txt);
  }
}