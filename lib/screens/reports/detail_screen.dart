import 'package:flutter/material.dart';

import '../../models/report_model/report_model.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/navigation/navigation.dart';
import '../../services/ui/text_styles.dart';
import '../../widgets/line_break.dart';

class ReportDetailScreen extends StatelessWidget {
  const ReportDetailScreen({super.key, required this.report});
  final ReportModel report;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            router.pop();
            RealTimeDatabase().saveUserInteraction(
                docID: report.docID,
                featureId: FeatureID.generatedContent.toString(),
                startTime: false,
                endTime: true);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'AI Generated Content',
          style: headlineSmall(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    report.title,
                    style: titleLarge(context),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  greyLineBreak,
                ],
              ),
              Text(
                report.content,
                style: titleMedium(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
