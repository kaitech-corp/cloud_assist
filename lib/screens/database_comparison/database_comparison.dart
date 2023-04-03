import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/comparison_model/comparison_model.dart';
import '../../models/database_architecture_model/database_architecture_model.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/firebase_functions/functions.dart';
import '../../services/navigation/navigation.dart';
import '../../services/service_config/service_config.dart';
import '../../services/ui/text_styles.dart';
import '../database_solution/bloc/bloc.dart';
import '../database_solution/bloc/repository.dart';
import '../database_solution/database_solution_screen.dart';
import '../tabs/components/fade_shimmer.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';
import 'components/floating_action_button.dart';

class DatabaseComparisonScreen extends StatefulWidget {
  const DatabaseComparisonScreen({super.key, required this.questions});
  final List<DatabaseArchitecture> questions;

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
  }

  @override
  void dispose() {
    _questionsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<QuestionsBloc, QuestionsState>(
        bloc: _questionsBloc,
        builder: (BuildContext context, QuestionsState state) {
          if (state.isSuccess) {
            answerSelected = List<AnswersSelected>.generate(
                10, (int index) => AnswersSelected(null, null));

            String docID = hashToString(state.answerSelected);
            return BlocProvider<ComparisonModelBloc>(
              create: (BuildContext context) => ComparisonModelBloc(
                  comparisonModelRepository: ComparisonModelRepository()
                    ..refresh(docID)),
              child: DatabaseSolutionScreen(
                questionsBloc: _questionsBloc,
              ),
            );
          } else {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose a Database.',
                        style: headlineSmall(context),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Generate a personalized database solution to fit your needs.',
                        style: titleSmall(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Container(height: 2, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: widget.questions.length,
                          itemBuilder: (BuildContext context, int index) {
                            final DatabaseArchitecture databaseArchitecture =
                                widget.questions[index];
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  databaseArchitecture.question,
                                  style: titleMedium(context),
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                DropdownButtonFormField<String>(
                                  dropdownColor: Colors.grey[300],
                                  isExpanded: true,
                                  alignment: Alignment.centerLeft,
                                  value: answerSelected[index].answer,
                                  onChanged: (String? value) {
                                    setState(() {
                                      answerSelected[index] = AnswersSelected(
                                          databaseArchitecture.question, value);
                                    });
                                    _questionsBloc.add(
                                      AnswersSelected(
                                        databaseArchitecture.question,
                                        value!,
                                      ),
                                    );
                                  },
                                  items: databaseArchitecture.answers
                                      .map<DropdownMenuItem<String>>(
                                        (String answer) =>
                                            DropdownMenuItem<String>(
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
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<QuestionsBloc, QuestionsState>(
                        bloc: _questionsBloc,
                        builder: (BuildContext context, QuestionsState state) {
                          return CustomFloatingActionButton(
                            onPressed: () {
                              _questionsBloc.add(
                                AnswersSubmitted(
                                    answerSelected: state.answerSelected),
                              );
                            },
                            icon: Icons.send,
                          );
                        }),
                  ),
                ),
              ], // <-- added missing closing bracket here
            );
          }
        },
      ),
    );
  }
}
