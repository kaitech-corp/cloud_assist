import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/generics/generic_bloc.dart';
import '../../bloc/generics/generic_state.dart';
import '../../bloc/generics/generics_event.dart';
import '../../models/report_model/report_model.dart';
import '../../repositories/report_repository.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/navigation/navigation.dart';
import '../../services/ui/text_styles.dart';

import '../../widgets/line_break.dart';
import '../tabs/components/fade_shimmer.dart';
import 'components/animated_icon_button.dart';
import 'components/tag_function.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  ReportsScreenState createState() => ReportsScreenState();
}

class ReportsScreenState extends State<ReportsScreen> {
  late GenericBloc<ReportModel, ReportRepository> bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<GenericBloc<ReportModel, ReportRepository>>(context);
    bloc.add(LoadingGenericData());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cloud Center',
          style: headlineMedium(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // SizedBox(
            //     height: SizeConfig.screenHeight * .065,
            //     width: SizeConfig.screenWidth,
            //     child: ListView(
            //       scrollDirection: Axis.horizontal,
            //       children: List<Widget>.generate(
            //           10,
            //           (int index) => Padding(
            //                 padding: const EdgeInsets.only(
            //                     top: 8, left: 16, bottom: 16),
            //                 child: ElevatedButton(
            //                     style: ElevatedButton.styleFrom(
            //                         elevation: 5,
            //                         backgroundColor:
            //                             Theme.of(context).primaryColor,
            //                         shadowColor: Colors.blueAccent,
            //                         side: const BorderSide(
            //                             color: Color(-3092272))),
            //                     onPressed: () {},
            //                     child: Text('tag $index',
            //                         style: titleSmall(context))),
            //               )),
            //     )),
            // const SizedBox(
            //   height: 16,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                'Recommended Content',
                style: titleLarge(context),
              ),
            ),
            greyLineBreak,
            BlocBuilder<GenericBloc<ReportModel, ReportRepository>,
                GenericState>(
              bloc: bloc,
              builder: (BuildContext context, GenericState state) {
                if (state is LoadingState) {
                  return Expanded(child: loadingShimmer());
                } else if (state is HasDataState) {
                  final List<ReportModel> reports =
                      state.data as List<ReportModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: reports.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ReportModel report = reports[index];
                        final String tags = getTagsToString(report.tags);
                        return GestureDetector(
                          onTap: () {
                            router.pushNamed('detail', extra: report);
                            FirestoreDatabase().saveUserInteraction(
                                docID: report.docID,
                                featureId:
                                    FeatureID.generatedContent.toString(),
                                startTime: true,
                                endTime: false);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        report.title,
                                        style: titleMedium(context),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        FirestoreDatabase().saveUserInteraction(
                                            startTime: true,
                                            endTime: false,
                                            featureId: FeatureID
                                                .generatedContent
                                                .toString(),
                                            docID: report.docID);
                                      },
                                      child: AnimatedIconButton(
                                        Icons.auto_awesome,
                                        report.docID,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  tags,
                                  style: titleSmall(context),
                                ),
                                const SizedBox(
                                  height: 8,
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
