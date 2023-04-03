import 'package:equatable/equatable.dart';

import '../../../models/comparison_model/comparison_model.dart';

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
  final ComparisonModel data;

  @override
  List<Object> get props => <Object>[data];
}
