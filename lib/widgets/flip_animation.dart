import 'package:flutter/material.dart';
import 'package:nil/nil.dart';

import '../services/service_config/service_config.dart';
import 'service_detail_card.dart';

class CardFlipAnimation extends StatefulWidget {
  const CardFlipAnimation({super.key});

  @override
  CardFlipAnimationState createState() => CardFlipAnimationState();
}

class CardFlipAnimationState extends State<CardFlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> fadeAnimation;
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: 0.0, end: 3.14).animate(_controller);
    fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    isFront = true;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isFront) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
          isFront = !isFront;
        });
      },
      child: Stack(
        children: <Widget>[
          Align(
            child: AnimatedBuilder(
              animation: fadeAnimation,
              builder: (BuildContext context, Widget? child) {
                return FadeTransition(
                  opacity: fadeAnimation,
                  child: isFront ? const Text('Hello') : const Text('Randy'),
                );
              },
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget? child) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.004)
                  ..rotateX(_animation.value),
                alignment: Alignment.center,
                child: Center(
                  child: SizedBox(
                    height: SizeConfig.screenHeight * .3,
                    width: SizeConfig.screenWidth * .8,
                    child: card(
                      const Center(
                        child: nil,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
