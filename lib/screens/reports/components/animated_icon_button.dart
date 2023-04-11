import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedIconButton extends HookWidget {
  const AnimatedIconButton(this.icon, {super.key});

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> size = useState<double>(24.0);

    return GestureDetector(
      onTap: () {
        size.value = size.value == 24.0 ? 48.0 : 24.0;
      },
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: IconButton(
          iconSize: size.value,
          color: Colors.blueAccent,
          onPressed: () {},
          icon: Icon(icon),
        ),
      ),
    );
  }
}
