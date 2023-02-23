import 'dart:math';

int randomIndex(List<dynamic> list) {
  final Random random =  Random();
  return random.nextInt(list.length);
}

dynamic getRandomValueFromList(List<dynamic> list) {
  final Random random =  Random();
  final int index = random.nextInt(list.length);
  return list[index];
}
