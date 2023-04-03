import 'package:equatable/equatable.dart';

import '../../../models/comparison_model/comparison_model.dart';


abstract class ComparisonModelState extends Equatable{
  const ComparisonModelState();

  @override
  List<Object> get props => <Object>[];
}
class ComparisonModelLoadingState extends ComparisonModelState {}
class ComparisonModelHasDataState extends ComparisonModelState {
  const ComparisonModelHasDataState(this.data);
  final ComparisonModel data;
  @override
  List<Object> get props => <Object>[data];
}
