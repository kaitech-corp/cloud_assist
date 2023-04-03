import 'dart:math';

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
  final Random random = Random();
  final int index = random.nextInt(list.length);
  return list[index];
}

String removeCloudAndWhitespace(String str) {
  final RegExp regex = RegExp('Cloud');
  final String newStr =
      str.replaceAll(regex, '').replaceAll(RegExp(r'\s+'), '');
  return newStr;
}

List<dynamic> getUniqueValues(List<dynamic> uniqueList) {
  // Shuffle the unique list to get a random order
  uniqueList.shuffle();

  // If the unique list has 3 or fewer elements, return it
  if (uniqueList.length <= 3) {
    return uniqueList;
  }

  // Otherwise, return the first 3 elements of the shuffled unique list
  return uniqueList.sublist(0, 3);
}

String hashToString(dynamic hash) {
  final String docID = hash.toString().hashCode.toString();
  return docID;
}
