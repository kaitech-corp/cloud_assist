import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/database_architecture_model/database_architecture_model.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/firebase_functions/functions.dart';
import '../../services/navigation/navigation.dart';
import '../../services/ui/text_styles.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';
import 'components/floating_action_button.dart';

// StatefulWidget for comparing database architectures
class DatabaseComparisonScreen extends StatefulWidget {
  // Constructor takes a list of DatabaseArchitecture objects as a parameter
  const DatabaseComparisonScreen({super.key, required this.questions});

  // List of DatabaseArchitecture objects
  final List<DatabaseArchitecture> questions;

  // Creates an instance of DatabaseComparisonScreenState
  @override
  DatabaseComparisonScreenState createState() =>
      DatabaseComparisonScreenState();
}

class DatabaseComparisonScreenState extends State<DatabaseComparisonScreen> {
  late QuestionsBloc _questionsBloc;
  List<AnswersSelected> answerSelected = List<AnswersSelected>.generate(
      10, (int index) => AnswersSelected(null, null));

  @override
  void initState() {
    super.initState();
    _questionsBloc = QuestionsBloc();
    RealTimeDatabase().saveUserInteraction(
        featureId: FeatureID.database.toString(),
        startTime: true,
        endTime: false);
  }

  @override
  void dispose() {
    _questionsBloc.close();
    RealTimeDatabase().saveUserInteraction(
        featureId: FeatureID.database.toString(),
        startTime: false,
        endTime: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocBuilder<QuestionsBloc, QuestionsState>(
          bloc: _questionsBloc,
          builder: (BuildContext context, QuestionsState state) {
            if (state.isSubmitting) {
              return Stack(
                children: <Widget>[
                  _buildContent(context),
                  _buildFloatingActionButton(context),
                ],
              );
            } else {
              return Stack(
                children: <Widget>[
                  _buildContent(context),
                  _buildFloatingActionButton(context),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle(context),
        const SizedBox(height: 4),
        _buildSubtitle(context),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Container(height: 2, color: Colors.grey),
        ),
        const SizedBox(height: 32),
        _buildQuestionsList(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Database Solution',
      style: headlineSmall(context),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      'Generate a personalized database solution to fit your needs.',
      style: titleSmall(context),
    );
  }

  Widget _buildQuestionsList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (BuildContext context, int index) {
          final DatabaseArchitecture databaseArchitecture =
              widget.questions[index];
          return _buildQuestionItem(context, databaseArchitecture);
        },
      ),
    );
  }

  Widget _buildQuestionItem(
      BuildContext context, DatabaseArchitecture databaseArchitecture) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          databaseArchitecture.question,
          style: titleMedium(context),
          maxLines: 2,
        ),
        const SizedBox(height: 8.0),
        _buildDropdownButtonFormField(context, databaseArchitecture),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildDropdownButtonFormField(
      BuildContext context, DatabaseArchitecture databaseArchitecture) {
    final int index = widget.questions.indexOf(databaseArchitecture);
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.grey[300],
      isExpanded: true,
      alignment: Alignment.centerLeft,
      value: answerSelected[index].answer,
      onChanged: (String? value) {
        setState(() {
          answerSelected[index] =
              AnswersSelected(databaseArchitecture.question, value);
        });
        _questionsBloc.add(
          AnswersSelected(
            databaseArchitecture.question,
            value!,
          ),
        );
        RealTimeDatabase().saveUserInteraction(
            serviceId: databaseArchitecture.question,
            featureId: FeatureID.database.toString(),
            startTime: true,
            endTime: false);
      },
      items: databaseArchitecture.answers
          .map<DropdownMenuItem<String>>(
            (String answer) => DropdownMenuItem<String>(
              value: answer,
              child: Text(
                answer,
                style: titleSmall(context),
                maxLines: 2,
                overflow: TextOverflow.visible,
              ),
            ),
          )
          .toList(),
      hint: Text(
        'Select an answer',
        style: titleSmall(context)?.copyWith(color: Colors.blueAccent),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<QuestionsBloc, QuestionsState>(
            bloc: _questionsBloc,
            builder: (BuildContext context, QuestionsState state) {
              return CustomFloatingActionButton(
                onPressed: () {
                  _questionsBloc.add(
                    AnswersSubmitted(answerSelected: state.answerSelected),
                  );
                  answerSelected = List<AnswersSelected>.generate(
                      10, (int index) => AnswersSelected(null, null));
                  final String docID = hashToString(state.answerSelected);
                  router.goNamed('solution', extra: docID);
                  RealTimeDatabase().saveUserInteraction(
                      featureId: FeatureID.popularServices.toString(),
                      startTime: false,
                      endTime: true);
                  _questionsBloc.add(SolutionViewed());
                },
                icon: Icons.send,
              );
            }),
      ),
    );
  }
}
/*
The code defines a StatefulWidget for comparing different database architectures.
The widget contains a list of DatabaseArchitecture objects, each with a question 
and a set of possible answers. The state of the widget contains a Bloc for 
managing the state of the questions and a list of AnswersSelected objects, each 
representing the selected answer for a particular question.


The widget's build method returns a SafeArea widget containing a Column with the 
title and subtitle, a divider, and a ListView containing the 
DatabaseArchitecture questions as items. Each question is rendered as a Column 
containing the question and a DropdownButtonFormField for selecting an answer. 
The state of the answerSelected list is updated whenever an answer is selected, 
and the new state is sent to the Bloc.


The widget also contains two private methods for rendering the title and 
subtitle, as well as a method for rendering each question item as a Column. 
Finally, there is a private method for rendering a FloatingActionButton for 
submitting the answers.
*/
