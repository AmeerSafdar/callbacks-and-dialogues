// ignore_for_file: unnecessary_string_interpolations, use_build_context_synchronously, no_leading_underscores_for_local_identifiers, use_rethrow_when_possible, prefer_const_constructors

import 'package:permission_handler/permission_handler.dart';

class PermissionUtils{
 Future<PermissionStatus> askPermission(Permission permissions) async{
    PermissionStatus status = await permissions.request();
    if(status.isDenied == true)
      {  
        return status;
         }
      if(status.isPermanentlyDenied == true)
      {  
        return status;
      }
    else if(status.isGranted)
      {
        return status;
      }
      return status;
  }
  
  }
