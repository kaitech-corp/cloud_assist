import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../models/gcloud_data_model/gcloud_data_model.dart';
import '../../screens/home/home.dart';
import '../../screens/tabs/components/service_details.dart';
import '../../screens/tabs/components/gcloud_detail_screen.dart';
import '../../screens/tabs/networking.dart';

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
          name: 'serviceDetails',
          path: 'serviceDetails',
          builder: (BuildContext context, GoRouterState state) {
            final CloudData serviceData = state.extra! as CloudData;
            return ServiceDetails(serviceData: serviceData);
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
        GoRoute(
          name: 'network',
          path: 'network',
          builder: (BuildContext context, GoRouterState state) {
            return const NetworkingServices();
          },
        ),
      ],
    ),
  ],
);
