import 'package:flutter/material.dart';

import '../../../services/constants.dart';

import '../../../services/ui/text_styles.dart';
import '../../../widgets/service_detail_card.dart';

class ServiceDetailsBottomSheet extends StatelessWidget {
  const ServiceDetailsBottomSheet(
      {super.key, required this.data, required this.index});
  final List<String> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            serviceDetailItems[index],
            style: headlineLarge(context),
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: List<Widget>.generate(
                  data.length,
                  (int index) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: card(Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data[index],
                            style: headlineSmall(context),
                          ),
                        )),
                      )),
            ),
          ),
        ),
      ],
    );
  }
}
