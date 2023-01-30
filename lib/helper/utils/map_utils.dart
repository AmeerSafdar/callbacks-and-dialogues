// ignore_for_file: use_rethrow_when_possible, no_leading_underscores_for_local_identifiers

import 'package:url_launcher/url_launcher.dart';

class MapUtils {
static Future<void> openMap(String uri) async {
    try{
      Uri _uri=Uri.parse(uri);
      if (await canLaunchUrl(_uri)) {
         await launchUrl(
          _uri,
          mode: await canLaunchUrl(_uri) ? LaunchMode.externalApplication : LaunchMode.platformDefault
          );
          } 
    }
    catch(e){
      throw e;
    }
  }
}