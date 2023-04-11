import 'package:flutter/material.dart';

import '../../../../services/ui/text_styles.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({
    super.key,
    required this.serviceData,
    required this.section,
  });

  final String serviceData;
  final String section;

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
          child: Text(serviceData, style: titleMedium(context)),
        ),
      ],
    );
  }
}
