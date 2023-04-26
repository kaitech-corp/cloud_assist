import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/generics/generic_bloc.dart';
import '../../../../bloc/generics/generic_state.dart';
import '../../../../bloc/generics/generics_event.dart';
import '../../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../../repositories/cloud_data_repository.dart';
import '../../../../services/firebase_functions/functions.dart';
import '../../../../services/service_config/service_config.dart';
import '../../../../services/ui/text_styles.dart';
import '../../../../widgets/line_break.dart';
import 'featured_service_widget.dart';

class FeaturedService extends StatefulWidget {
  const FeaturedService({super.key});

  @override
  State<FeaturedService> createState() => _FeaturedServiceState();
}

class _FeaturedServiceState extends State<FeaturedService> {
  late final GenericBloc<CloudData, CloudDataRepository> bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<GenericBloc<CloudData, CloudDataRepository>>(context)
      ..add(LoadingGenericData());
  }

  @override
  void dispose() {
    // bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('FEATURED SERVICES', style: titleMedium(context)),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<GenericBloc<CloudData, CloudDataRepository>,
              GenericState>(
            bloc: bloc,
            builder: (BuildContext context, GenericState state) {
              if (state is LoadingState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (int i = 0; i < 3; i++)
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 24.0,
                                top: 16.0,
                                right: 24,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      FadeShimmer(
                                        height: 8,
                                        width: SizeConfig.screenWidth * .2,
                                        radius: 4,
                                        highlightColor: Colors.white,
                                        baseColor:
                                            Theme.of(context).disabledColor,
                                      ),
                                      FadeShimmer.round(
                                        size: SizeConfig.screenWidth * .05,
                                        highlightColor: Colors.white,
                                        baseColor:
                                            Theme.of(context).disabledColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenWidth * .05,
                                  ),
                                  FadeShimmer(
                                    height: 8,
                                    width: SizeConfig.screenWidth,
                                    radius: 4,
                                    highlightColor: Colors.white,
                                    baseColor: Theme.of(context).disabledColor,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenWidth * .05,
                                  ),
                                  FadeShimmer(
                                    height: 8,
                                    width: SizeConfig.screenWidth,
                                    radius: 4,
                                    highlightColor: Colors.white,
                                    baseColor: Theme.of(context).disabledColor,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenWidth * .05,
                                  ),
                                ],
                              ),
                            ),
                            greyLineBreak,
                          ],
                        ),
                      ),
                  ],
                );
              } else if (state is HasDataState) {
                final List<CloudData> data = state.data as List<CloudData>;
                final List<CloudData> uniqueServices = getUniqueValues(data);
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      for (final CloudData service in uniqueServices)
                        Column(
                          children: <Widget>[
                            FeaturedServiceWidget(cloudData: service),
                            greyLineBreak,
                          ],
                        ),
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
