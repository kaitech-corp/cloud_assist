import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nil/nil.dart';

import '../../models/comparison_model/comparison_model.dart';
import '../../services/service_config/service_config.dart';
import '../../services/ui/text_styles.dart';
import '../database_comparison/bloc/bloc.dart';
import '../database_comparison/bloc/event.dart';
import '../database_comparison/bloc/state.dart';
import '../tabs/components/fade_shimmer.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';

import 'bloc/state.dart';

class DatabaseSolutionScreen extends StatefulWidget {
  const DatabaseSolutionScreen({super.key, required this.questionsBloc});
  final QuestionsBloc questionsBloc;

  @override
  State<DatabaseSolutionScreen> createState() => _DatabaseSolutionScreenState();
}

class _DatabaseSolutionScreenState extends State<DatabaseSolutionScreen> {
  late final ComparisonModelBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<ComparisonModelBloc>(context);
    bloc.add(LoadingComparisonModelData());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComparisonModelBloc, ComparisonModelState>(
        builder: (BuildContext context, ComparisonModelState state) {
      if (state is ComparisonModelLoadingState) {
        return loadingReponseShimmer();
      } else if (state is ComparisonModelHasDataState) {
        final ComparisonModel model = state.data;
        if (model.answer.isEmpty) {
          return SizedBox(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Generating Solution. Sit tight.',
                      style: titleLarge(context)),
                ),
                Expanded(child: loadingReponseShimmer())
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          widget.questionsBloc.add(SolutionViewed());
                          bloc.close();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    Text(
                      'Solution',
                      style: headlineSmall(context),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    model?.answer ?? '',
                    style: titleMedium(context),
                  ),
                ),
              ],
            ),
          );
        }
      } else {
        return nil;
      }
    });
  }
}