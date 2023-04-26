import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../services/constants.dart';
import '../../../services/firebase_functions/firebase_functions.dart';

class AnimatedIconButton extends HookWidget {
  const AnimatedIconButton(this.icon, this.item, {super.key});

  final IconData icon;
  final String? item;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> size = useState<double>(24.0);

    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: IconButton(
        iconSize: size.value,
        color: Colors.blueAccent,
        onPressed: () {
          RealTimeDatabase().saveUserInteraction(
              startTime: true,
              endTime: false,
              docID: item,
              featureId: FeatureID.like.toString());
        },
        icon: Icon(icon),
      ),
    );
  }
}
