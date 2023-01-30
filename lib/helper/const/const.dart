// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:task5/helper/utils/dialogue_utils.dart';
import 'package:task5/helper/utils/permission_utils.dart';

 final DialogUtils dialogue_utils = DialogUtils();
 final PermissionUtils permission_handler = PermissionUtils();

 double originLatitude = 33.70964;
 double originLongitude = 73.07545;
 double destLatitude = 32.0740;
 double destLongitude = 72.6861;
 String map_url ='https://www.google.com/maps/dir/?api=1&origin=$originLatitude,$originLongitude&destination=$destLatitude,$destLongitude&dir_action=navigate';
 