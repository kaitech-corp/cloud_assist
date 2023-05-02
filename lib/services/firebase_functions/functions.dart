import 'dart:math';

import '../../models/cloud_data_model/cloud_data_model.dart';

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

  return shuffledList.sublist(0, 3);
}

String hashToString(dynamic hash) {
  final String docID = hash.toString().hashCode.toString();
  return docID;
}

List<CloudData> transformAndFilter(
  List<CloudData> cloudData,
  List<String> dataList,
) {
  final List<CloudData> filteredData = cloudData
      .where((CloudData item) =>
          dataList.contains(removeCloudAndWhitespace(item.service)))
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
      r'^[a-zA-Z0-9.!#$%&\*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  if (!emailRegExp.hasMatch(email)) {
    return false;
  }
  return true;
}
