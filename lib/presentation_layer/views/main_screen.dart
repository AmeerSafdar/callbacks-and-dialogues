// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task5/bloc/mainScreen_bloc/bloc.dart';
import 'package:task5/bloc/mainScreen_bloc/events.dart';
import 'package:task5/bloc/mainScreen_bloc/states.dart';
import 'package:task5/helper/const/common_keys.dart';
import 'package:task5/helper/const/const.dart';
import 'package:task5/helper/const/string_helper.dart';
import 'package:task5/helper/utils/map_utils.dart';
import 'package:task5/presentation_layer/widget/button_widget.dart';
import 'package:task5/presentation_layer/widget/sizedBox_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AndroidIntent? intent;
  @override
  Widget build(BuildContext context) {
    final bloc= BlocProvider.of<MainBlocs>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(StringHelper.MAIN_SCREEN),
      ),
      body: BlocListener<MainBlocs, States>(
        listener: (context, state) {
          if (state.status==Status.denied) {
            dialogue_utils.showAlertDialog(
                 context, 
                  yesButtonTap: ()=>Navigator.pop(context), 
                 NoButtonTap:()=> Navigator.pop(context),
                 action: StringHelper.PERMISSION, 
                 titleContent: '${StringHelper.PERMISSION_DENIED}'
                 );
          }
          if (state.status==Status.permamentDenied) {
            dialogue_utils.showAlertDialog(
                 context, 
                 yesButtonTap: ()=>Navigator.pop(context,openAppSettings()), 
                 NoButtonTap:()=> Navigator.pop(context),
                 action: StringHelper.PERMISSION, 
                 titleContent: '${StringHelper.PERMISSION_PERMANENT_DENIED} ${StringHelper.OPEN_APP_SETTINGS} '
                 );
          }
          if (state.status==Status.storageGranted) {
            dialogue_utils.showAlertDialog(
                 context, 
                  yesButtonTap: ()=>Navigator.pop(context), 
                 NoButtonTap: ()=> Navigator.pop(context),
                 action: StringHelper.STORAGE_TEXT, 
                 titleContent: '${StringHelper.PERMISSION_GRANTED} '
                 );
          }
          if (state.status==Status.callState) {
            intentCallSMS('${Keys.CALL_ACTION}','${Keys.TELEPHONE_KEY}${StringHelper.MOBILE_NUMBER}');
            dialogue_utils.showAlertDialog(
                 context, 
                  yesButtonTap: ()=>Navigator.pop(context,intent!.launch()), 
                 NoButtonTap: ()=> Navigator.pop(context),
                 action: StringHelper.CALL_ME, 
                 titleContent: '${StringHelper.CALL_TXT} '
                 );
          }
          if (state.status==Status.messageState) {
             intentCallSMS('${Keys.SMS_ACTION}','${Keys.SMS_KEY}${StringHelper.MOBILE_NUMBER}');
             dialogue_utils.showAlertDialog(
                 context, 
                  yesButtonTap: ()=>Navigator.pop(context,intent!.launch()), 
                 NoButtonTap: ()=> Navigator.pop(context),
                 action: StringHelper.MESSAGE_ME, 
                 titleContent: '${StringHelper.MESSAGE_TXT} '
                 );
          }
          if (state.status==Status.locationState) {
            dialogue_utils.showAlertDialog(
                  context, 
                  yesButtonTap: ()=>Navigator.pop(context,MapUtils.openMap(map_url)), 
                 NoButtonTap: ()=>Navigator.pop(context),
                 action: StringHelper.LOCATION_TEXT, 
                 titleContent: '${StringHelper.LOCATION}', 
                 );
          }
        },

        child: BlocBuilder<MainBlocs, States>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonWidget(
                      btn_txt: StringHelper.MESSAGE_ME,
                      pressed: () => bloc.add(SMS())
                      ),

                  SizeBoxWidget(heights: 10),

                  ButtonWidget(
                    btn_txt: StringHelper.CALL_ME,
                    pressed: () =>bloc.add(DialCalls()),
                     ),

                  SizeBoxWidget(heights: 10),

                  ButtonWidget(
                      btn_txt: StringHelper.LOCATION_TEXT,
                      pressed: () => bloc.add(Location())
                      ),

                  SizeBoxWidget(heights: 10),

                  ButtonWidget(
                    btn_txt: StringHelper.STORAGE_TEXT,
                    pressed: () => bloc.add(Storage()),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  
 intentCallSMS(String actions, String dta) {
     intent =  AndroidIntent(
           action: actions,
           data: dta,
     );
  }
}
