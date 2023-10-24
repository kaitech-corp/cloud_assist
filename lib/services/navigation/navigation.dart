import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/generics/generic_bloc.dart';
import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../models/comparison_model/comparison_model.dart';
import '../../models/gcloud_data_model/gcloud_data_model.dart';
import '../../models/report_model/report_model.dart';
import '../../repositories/report_repository.dart';
import '../../repositories/solutions_repository.dart';
import '../../screens/admin/admin_screen.dart';
import '../../screens/database_solution/bloc/bloc.dart';
import '../../screens/database_solution/bloc/repository.dart';
import '../../screens/database_solution/database_solution_screen.dart';
import '../../screens/home/components/quick_links/quick_link_list.dart';
import '../../screens/reports/detail_screen.dart';
import '../../screens/reports/reports.dart';
import '../../screens/root/root_page.dart';
import '../../screens/solutions/solution_list_screen.dart';
import '../../screens/solutions/solution_screen.dart';
import '../../screens/tabs/components/gcloud_detail_screen.dart';
import '../../screens/tabs/services/service_details.dart';

///Go router navigation
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const RootPage();
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
          name: 'solutions',
          path: 'solutions',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider<
                GenericBloc<ComparisonModel, SolutionsRepository>>(
              create: (BuildContext context) =>
                  GenericBloc<ComparisonModel, SolutionsRepository>(
                      repository: SolutionsRepository()),
              child: const SolutionListScreen(),
            );
          },
        ),
        GoRoute(
          name: 'solution',
          path: 'solution',
          builder: (BuildContext context, GoRouterState state) {
            final String docID = state.extra! as String;
            return BlocProvider<ComparisonModelBloc>(
              create: (BuildContext context) => ComparisonModelBloc(
                  comparisonModelRepository: ComparisonModelRepository()
                    ..refresh(docID)),
              child: const DatabaseSolutionScreen(),
            );
          },
        ),
        GoRoute(
          name: 'solutionDetail',
          path: 'solutionDetail',
          builder: (BuildContext context, GoRouterState state) {
            final ComparisonModel model = state.extra! as ComparisonModel;
            return SolutionScreen(
              model: model,
            );
          },
        ),
        GoRoute(
          name: 'reports',
          path: 'reports',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider<GenericBloc<ReportModel, ReportRepository>>(
              create: (BuildContext context) =>
                  GenericBloc<ReportModel, ReportRepository>(
                      repository: ReportRepository()),
              child: const ReportsScreen(),
            );
          },
        ),
        GoRoute(
          name: 'detail',
          path: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            final ReportModel report = state.extra! as ReportModel;
            return ReportDetailScreen(report: report);
          },
        ),
        GoRoute(
          name: 'admin',
          path: 'admin',
          builder: (BuildContext context, GoRouterState state) {
            return const AdminScreen();
          },
        ),
        GoRoute(
          name: 'linkList',
          path: 'linkList',
          builder: (BuildContext context, GoRouterState state) {
            return const QuickLinkList();
          },
        ),
      ],
    ),
  ],
);
