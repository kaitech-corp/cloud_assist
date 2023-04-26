import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nil/nil.dart';

import '../../models/comparison_model/comparison_model.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/navigation/navigation.dart';
import '../../services/service_config/service_config.dart';
import '../../services/ui/text_styles.dart';
import '../tabs/components/fade_shimmer.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';

class DatabaseSolutionScreen extends StatefulWidget {
  const DatabaseSolutionScreen({super.key});

  @override
  State<DatabaseSolutionScreen> createState() => _DatabaseSolutionScreenState();
}

class _DatabaseSolutionScreenState extends State<DatabaseSolutionScreen> {
  late final ComparisonModelBloc bloc;

  @override
  void dispose() {
    bloc.close();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<ComparisonModelBloc>(context);
    bloc.add(LoadingComparisonModelData());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComparisonModelBloc, ComparisonModelState>(
        builder: (BuildContext context, ComparisonModelState state) {
      if (state is ComparisonModelLoadingState) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              leading: IconButton(
                onPressed: () {
                  router.pop();
                  RealTimeDatabase().saveUserInteraction(
                      featureId: FeatureID.generatedSolution.toString(),
                      startTime: true,
                      endTime: false);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            body: loadingReponseShimmer());
      } else if (state is ComparisonModelHasDataState) {
        final ComparisonModel model = state.data;
        if (model.answer.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              leading: IconButton(
                onPressed: () {
                  router.pop();
                  RealTimeDatabase().saveUserInteraction(
                      featureId: FeatureID.generatedSolution.toString(),
                      startTime: true,
                      endTime: false);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            body: SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Generating Solution. Sit tight.',
                        style: titleLarge(context)),
                  ),
                  Expanded(child: loadingReponseShimmer())
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text(
                'Solution',
                style: headlineMedium(context),
              ),
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
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  model.answer,
                  style: titleMedium(context),
                ),
              ),
            ),
          );
        }
      } else {
        return nil;
      }
    });
  }
}

// You can use a callback function to reset the `DatabaseComparisonScreen` when the `DatabaseSolutionScreen` is closed.

// First, add a callback function to `DatabaseSolutionScreen`:

// ```dart
// class DatabaseSolutionScreen extends StatefulWidget {
//   const DatabaseSolutionScreen({required this.questionsBloc, required this.onSolutionClosed});
//   final QuestionsBloc questionsBloc;
//   final VoidCallback onSolutionClosed;

//   @override
//   State<DatabaseSolutionScreen> createState() => _DatabaseSolutionScreenState();
// }
// ```

// Then, in `_DatabaseSolutionScreenState`, call the callback when the close button is pressed:

// ```dart
// IconButton(
//   onPressed: () {
//     widget.questionsBloc.add(SolutionViewed(model: model));
//     bloc.close();
//     widget.onSolutionClosed(); // Call the callback function
//   },
//   icon: const Icon(Icons.close)),
// ```

// Now, in `DatabaseComparisonScreen`, pass the callback function that resets the screen:

// ```dart
// BlocProvider<ComparisonModelBloc>(
//   create: (BuildContext context) => ComparisonModelBloc(
//     comparisonModelRepository: ComparisonModelRepository()
//       ..refresh(docID)),
//   child: DatabaseSolutionScreen(
//     questionsBloc: _questionsBloc,
//     onSolutionClosed: () {
//       _questionsBloc.add(ResetScreen()); // Add a new event to reset the screen
//     },
//   ),
// ),
// ```

// Finally, add the `ResetScreen` event to your `QuestionsBloc` and handle it:

// ```dart
// class ResetScreen extends QuestionsEvent {}

// // ...

// on<ResetScreen>((event, emit) async {
//   // Reset the state to the initial state
//   emit(QuestionsState.submitting());
// });
// ```

// With this implementation, when the `DatabaseSolutionScreen` is closed, the callback function will be called, which will trigger the `ResetScreen` event in `QuestionsBloc`, resetting the `DatabaseComparisonScreen`.
