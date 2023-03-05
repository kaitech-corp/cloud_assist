import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../services/ui/text_styles.dart';

class QuickFactCarousel extends StatefulWidget {
  const QuickFactCarousel({
    super.key,
    required this.facts,
  });

  final List<String> facts;

  @override
  State<QuickFactCarousel> createState() => _QuickFactCarouselState();
}

class _QuickFactCarouselState extends State<QuickFactCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              aspectRatio: 2.8,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 20),
              onPageChanged: (int index, _) {
                setState(() => _current = index);
              },
            ),
            items: widget.facts.map((fact) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  fact,
                  style: titleMedium(context),
                  textAlign: TextAlign.start,
                ),
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.facts
                .map((String fact) => GestureDetector(
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black)
                                .withOpacity(_current == fact ? 0.9 : 0.4)),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
