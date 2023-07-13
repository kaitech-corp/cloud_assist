import 'dart:math';

String getTagsToString(List<String> items) {
  List<String> randomItems = <String>[];
  
  if (items.length >= 3) {
    final Set<int> randomIndices = <int>{};
    
    // Generate 3 unique random indices
    while (randomIndices.length < 3) {
      final int randomIndex = Random().nextInt(items.length);
      randomIndices.add(randomIndex);
    }
    
    // Get items at the random indices
    for (final int index in randomIndices) {
      randomItems.add(items[index]);
    }
  } else {
    // If there are less than 3 items, return all items
    randomItems = List<String>.from(items);
  }
  
  return randomItems.join(', ');
}
