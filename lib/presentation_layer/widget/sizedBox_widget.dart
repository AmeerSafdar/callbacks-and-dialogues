// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/cupertino.dart';

class SizeBoxWidget extends StatelessWidget {
  
   SizeBoxWidget({super.key, required this.heights});
   double heights;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:heights 
    );
  }
}