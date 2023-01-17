import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/cloud_data_model.dart';
import '../../../screens/detail_screen.dart';
import '../../../screens/home.dart';
import '../../models/gcloud_data_model/gcloud_data_model.dart';
import '../../screens/detail_tab_screen.dart';
import '../../screens/gcloud_detail_screen.dart';

///Go router navigation
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'details',
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            final CloudData serviceData = state.extra! as CloudData;
            return DetailTabScreen(serviceData: serviceData);
          },
        ),
        GoRoute(
          name: 'gcloud',
          path: 'gcloud',
          builder: (BuildContext context, GoRouterState state) {
            final GCloudData gCloudData = state.extra! as GCloudData;
            return GCloudDetailScreen(gCloudData: gCloudData);
          },
        ),
      ],
    ),
  ],
);
