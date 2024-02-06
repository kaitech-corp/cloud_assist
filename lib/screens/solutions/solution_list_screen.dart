import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/generics/generic_bloc.dart';
import '../../bloc/generics/generic_state.dart';
import '../../bloc/generics/generics_event.dart';
import '../../models/comparison_model/comparison_model.dart';
import '../../repositories/solutions_repository.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';

import '../../services/firebase_functions/functions.dart';
import '../../services/navigation/navigation.dart';
import '../../services/ui/text_styles.dart';

import '../../widgets/line_break.dart';
import '../reports/components/animated_icon_button.dart';
import '../tabs/components/fade_shimmer.dart';

class SolutionListScreen extends StatefulWidget {
  const SolutionListScreen({super.key});

  @override
  SolutionListScreenState createState() => SolutionListScreenState();
}

class SolutionListScreenState extends State<SolutionListScreen> {
  late GenericBloc<ComparisonModel, SolutionsRepository> bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<GenericBloc<ComparisonModel, SolutionsRepository>>(
        context);
    bloc.add(LoadingGenericData());
  }

  @override
  void dispose() {
    bloc.close();
    FirestoreDatabase().saveUserInteraction(
        featureId: FeatureID.databaseSolutions.toString(),
        startTime: false,
        endTime: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Solutions',
          style: headlineMedium(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: BlocBuilder<GenericBloc<ComparisonModel, SolutionsRepository>,
            GenericState>(
          bloc: bloc,
          builder: (BuildContext context, GenericState state) {
            if (state is LoadingState) {
              return loadingShimmer();
            } else if (state is HasDataState) {
              final List<ComparisonModel> solutions =
                  state.data as List<ComparisonModel>;
              return ListView.builder(
                itemCount: solutions.length,
                itemBuilder: (BuildContext context, int index) {
                  final ComparisonModel solution = solutions[index];
                  final String? date = formatDate(solution.timestamp);
                  return GestureDetector(
                    onTap: () {
                      router.pushNamed('solutionDetail', extra: solution);
                      FirestoreDatabase().saveUserInteraction(
                          docID: solution.docID,
                          featureId: FeatureID.databaseSolutions.toString(),
                          startTime: true,
                          endTime: false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            solution.answer,
                            style: titleMedium(context),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '$date',
                                  style: titleMedium(context),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  FirestoreDatabase().saveUserInteraction(
                                      startTime: true,
                                      endTime: false,
                                      featureId: FeatureID.databaseSolutions
                                          .toString(),
                                      docID: solution.docID);
                                },
                                child: AnimatedIconButton(
                                    Icons.auto_awesome, solution.docID),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          greyLineBreak
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
