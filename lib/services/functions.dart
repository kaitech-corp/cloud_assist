import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlFunc(String url) async {
  try {
    await launchUrl(Uri.parse(url));
  } catch (e) {
    if (kDebugMode) {
      print('Could not launch: ${e.toString()}');
    }
  }
}
