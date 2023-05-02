import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlFunc(String url) async {
  try {
    await launchUrl(Uri.parse(url));
  } catch (e) {
    if (kDebugMode) {
      // ignore: noop_primitive_operations
      print('Could not launch: ${e.toString()}');
    }
  }
}

String? formatDate(DateTime? dateTime) {
  if (dateTime == null) {
    return null;
  }
  
  final DateFormat format = DateFormat.MMMMd().add_y();
  return format.format(dateTime);
}

