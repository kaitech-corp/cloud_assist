import 'package:flutter/material.dart';

import '../../models/comparison_model/comparison_model.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/navigation/navigation.dart';
import '../../services/ui/text_styles.dart';

class SolutionScreen extends StatelessWidget {
  const SolutionScreen({super.key, required this.model});

  final ComparisonModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            router.pop();
            RealTimeDatabase().saveUserInteraction(
                docID: model.docID,
                featureId: FeatureID.generatedSolution.toString(),
                startTime: false,
                endTime: true);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Solution',
          style: headlineMedium(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            model.answer,
            style: titleMedium(context),
          ),
        ),
      ],
        ),
      ),
    );
  }
}
