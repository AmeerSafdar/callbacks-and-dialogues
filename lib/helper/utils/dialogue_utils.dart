// ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:task5/helper/const/string_helper.dart';
import 'package:task5/presentation_layer/widget/text_widgets.dart';
class DialogUtils{
  showAlertDialog(BuildContext context,
  {required VoidCallback yesButtonTap, required VoidCallback NoButtonTap, 
   required String action,required String titleContent}){  
      Widget cancelButton = TextButton(
      child: TextsWidget(txt:StringHelper.CANCEL),
      onPressed: NoButtonTap,
    );
    Widget continueButton = TextButton(
      child: TextsWidget(txt:StringHelper.OK),
      onPressed: yesButtonTap,
    );
     AlertDialog alert = AlertDialog(
      
      title: TextsWidget(txt:action),
      content: TextsWidget(txt:titleContent),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

   return Future.delayed(Duration.zero,(() {
     showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
   }));
    } 
}