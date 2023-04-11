import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/generics/generic_bloc.dart';
import '../../bloc/generics/generic_state.dart';
import '../../bloc/generics/generics_event.dart';
import '../../models/comparison_model/comparison_model.dart';
import '../../repositories/solutions_repository.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/functions.dart';
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
    RealTimeDatabase().saveUserInteraction(
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
        padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                'Generated Solutions',
                style: titleLarge(context),
              ),
            ),
            greyLineBreak,
            BlocBuilder<GenericBloc<ComparisonModel, SolutionsRepository>,
                GenericState>(
              bloc: bloc,
              builder: (BuildContext context, GenericState state) {
                if (state is LoadingState) {
                  return Expanded(child: loadingShimmer());
                } else if (state is HasDataState) {
                  final List<ComparisonModel> solutions =
                      state.data as List<ComparisonModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: solutions.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ComparisonModel solution = solutions[index];
                        final String? date = formatDate(solution.timestamp);
                        return GestureDetector(
                          onTap: () {
                            router.pushNamed('solutionDetail', extra: solution);
                            RealTimeDatabase().saveUserInteraction(
                                docID: solution.docID,
                                featureId:
                                    FeatureID.databaseSolutions.toString(),
                                startTime: true,
                                endTime: false);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 24.0),
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
                                        'Created: $date',
                                        style: titleMedium(context),
                                      ),
                                    ),
                                    const AnimatedIconButton(
                                        Icons.auto_awesome),
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
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
