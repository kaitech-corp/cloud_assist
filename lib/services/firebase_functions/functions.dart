import 'dart:math';

int randomIndex(List<dynamic> list) {
  final Random random =  Random();
  return random.nextInt(list.length - 3);
}

dynamic getRandomValueFromList(List<dynamic> list) {
  final Random random =  Random();
  final int index = random.nextInt(list.length);
  return list[index];
}

String removeCloudAndWhitespace(String str) {
  final RegExp regex = RegExp('Cloud');
  final String newStr = str.replaceAll(regex, '').replaceAll(RegExp(r'\s+'), '');
  return newStr;
}
