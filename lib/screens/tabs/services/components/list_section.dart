import 'package:flutter/material.dart';

import '../../../../services/ui/text_styles.dart';
import 'list_text_layout.dart';

class ListSection extends StatelessWidget {
  const ListSection({
    super.key,
    required this.serviceData,
    required this.section, required this.service,
  });

  final List<String> serviceData;
  final String section;
  final String service;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(section,
            style: titleLarge(context)
                ?.copyWith(decoration: TextDecoration.underline)),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
                serviceData.length,
                (int index) => ListTextLayout(
                      serviceItem: serviceData[index],
                      index: index,
                      section: section,
                      service: service,
                    )),
          ),
        ),
      ],
    );
  }
}
