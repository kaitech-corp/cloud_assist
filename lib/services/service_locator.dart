import 'package:get_it/get_it.dart';
import '../repositories/cloud_data_repository.dart';
import '../repositories/quick_facts_repository.dart';
import '../repositories/report_repository.dart';
import '../repositories/solutions_repository.dart';
import '../repositories/user_repository.dart';
import '../screens/database_solution/bloc/repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<UserRepository>(() => UserRepository());
  locator.registerLazySingleton<CloudDataRepository>(() => CloudDataRepository());
  locator.registerLazySingleton<QuickFactsRepository>(() => QuickFactsRepository());
  locator.registerLazySingleton<ReportRepository>(() => ReportRepository());
  locator.registerLazySingleton<SolutionsRepository>(() => SolutionsRepository());
  locator.registerLazySingleton<ComparisonModelRepository>(() => ComparisonModelRepository());
}
