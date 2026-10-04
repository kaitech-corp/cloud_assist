import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';

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

int randomIndex(List<dynamic> list) {
  final Random random = Random();
  final int count = list.length;
  if (count > 4) {
    return random.nextInt(list.length - 3);
  } else {
    return 0;
  }
}

dynamic getRandomValueFromList(List<dynamic> list) {
  if (list.isEmpty) {
    return '';
  }
  final Random random = Random();
  final int index = random.nextInt(list.length);
  return list[index];
}

String removeCloudAndWhitespace(String str) {
  final RegExp regex = RegExp(r'Cloud|\s+');
  final String newStr = str.replaceAll(regex, '').replaceAll('/', '');
  return newStr;
}

List<T> getUniqueValues<T>(List<T> uniqueList) {
  final List<T> shuffledList = List<T>.from(uniqueList)..shuffle();

  if (shuffledList.length <= 3) {
    return shuffledList;
  }

  return shuffledList.sublist(0, 2);
}

String hashToString(dynamic hash) {
  final String input = _stableEncode(hash);
  int value = 0x811c9dc5;
  for (final int codeUnit in input.codeUnits) {
    value ^= codeUnit;
    value = (value * 0x01000193) & 0xffffffff;
  }
  return value.toRadixString(16);
}

String _stableEncode(dynamic value) {
  if (value is Map) {
    final List<String> keys =
        value.keys.map((dynamic key) => key.toString()).toList()..sort();
    return jsonEncode(<String, dynamic>{
      for (final String key in keys) key: _stableDecode(value[key]),
    });
  }
  if (value is Iterable) {
    return jsonEncode(value.map(_stableDecode).toList());
  }
  return jsonEncode(value);
}

dynamic _stableDecode(dynamic value) {
  if (value is Map) {
    final List<String> keys =
        value.keys.map((dynamic key) => key.toString()).toList()..sort();
    return <String, dynamic>{
      for (final String key in keys) key: _stableDecode(value[key]),
    };
  }
  if (value is Iterable && value is! String) {
    return value.map(_stableDecode).toList();
  }
  return value;
}

List<CloudData> transformAndFilter(
  List<CloudData> cloudData,
  List<String> dataList,
) {
  final List<CloudData> filteredData = cloudData
      .where(
        (CloudData item) =>
            dataList.contains(removeCloudAndWhitespace(item.service)),
      )
      .toList();
  return filteredData;
}

String formatFieldNames(String input) {
  final String output = input.toLowerCase().replaceAll(' ', '_');
  return output;
}

bool validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  }
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&\*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  if (!emailRegExp.hasMatch(email)) {
    return false;
  }
  return true;
}
