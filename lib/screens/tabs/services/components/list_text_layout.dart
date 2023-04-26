import 'package:flutter/material.dart';

import '../../../../services/firebase_functions/functions.dart';
import '../../../../services/ui/text_styles.dart';
import '../../../report_dialog/report_dialog.dart';

class ListTextLayout extends StatelessWidget {
  const ListTextLayout({
    super.key,
    required this.serviceItem,
    required this.index,
    required this.service, required this.section,
  });

  final String serviceItem;
  final int index;
  final String service;
  final String section;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => ReportDialog(
                  content: serviceItem,
                  contentDocID: service,
                  contentField: formatFieldNames(section),
                ));
      },
      child: Padding(
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
                serviceItem,
                style: titleMedium(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
