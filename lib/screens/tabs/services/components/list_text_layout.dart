import 'package:flutter/material.dart';

import '../../../../services/ui/text_styles.dart';

class ListTextLayout extends StatelessWidget {
  const ListTextLayout({
    super.key,
    required this.serviceData,
    required this.index,
  });

  final List<String> serviceData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${index + 1}) ',
            style: titleMedium(context),
          ),
          Flexible(
            child: Text(
              serviceData[index],
              style: titleMedium(context),
            ),
          ),
        ],
      ),
    );
  }
}
