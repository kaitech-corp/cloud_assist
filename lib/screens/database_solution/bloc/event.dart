import 'package:equatable/equatable.dart';

import 'repository.dart';

abstract class ComparisonModelEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

class LoadingComparisonModelData extends ComparisonModelEvent {
  @override
  List<Object> get props => <Object>[];
}

class ComparisonModelHasDataEvent extends ComparisonModelEvent {
  ComparisonModelHasDataEvent(this.data);
  final DatabaseSolutionResult data;

  @override
  List<Object> get props => <Object>[data];
}
