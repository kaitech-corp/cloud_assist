import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../models/quick_fact_model/quick_fact_model.dart';
import '../../../services/service_config/service_config.dart';
import '../../../widgets/service_detail_card.dart';

class QuickFactCarousel extends StatefulWidget {
  const QuickFactCarousel({
    super.key,
    required this.facts,
  });

  final List<QuickFact> facts;

  @override
  State<QuickFactCarousel> createState() => _QuickFactCarouselState();
}

class _QuickFactCarouselState extends State<QuickFactCarousel> {
  final int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(height: SizeConfig.screenHeight * .155,viewportFraction: 1,),
          items: widget.facts.map((QuickFact fact) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                  height: SizeConfig.screenHeight * .15,
                  width: SizeConfig.screenWidth,
                  child: funFactCard(Text(fact.fact))),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.facts.asMap().entries.map((MapEntry<int, QuickFact> fact) {
            return GestureDetector(
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == fact.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
