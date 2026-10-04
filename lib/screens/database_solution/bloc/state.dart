import 'package:equatable/equatable.dart';

import 'repository.dart';

abstract class ComparisonModelState extends Equatable {
  const ComparisonModelState();

  @override
  List<Object> get props => <Object>[];
}

class ComparisonModelLoadingState extends ComparisonModelState {}

class ComparisonModelHasDataState extends ComparisonModelState {
  const ComparisonModelHasDataState(this.data);
  final DatabaseSolutionResult data;
  @override
  List<Object> get props => <Object>[data];
}
