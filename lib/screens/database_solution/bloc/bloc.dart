import 'dart:async';

import 'package:bloc/bloc.dart';

import 'event.dart';
import 'repository.dart';
import 'state.dart';

class ComparisonModelBloc
    extends Bloc<ComparisonModelEvent, ComparisonModelState> {
  ComparisonModelBloc({this.comparisonModelRepository})
    : super(ComparisonModelLoadingState()) {
    on<LoadingComparisonModelData>((
      LoadingComparisonModelData event,
      Emitter<ComparisonModelState> emit,
    ) async {
      _subscription = comparisonModelRepository?.answer
          .asBroadcastStream()
          .listen((DatabaseSolutionResult data) {
            add(ComparisonModelHasDataEvent(data));
          });
    });
    on<ComparisonModelHasDataEvent>(
      (
        ComparisonModelHasDataEvent event,
        Emitter<ComparisonModelState> emit,
      ) async => emit(ComparisonModelHasDataState(event.data)),
    );
  }
  final ComparisonModelRepository? comparisonModelRepository;
  StreamSubscription<dynamic>? _subscription;

  ComparisonModelState get initialState => ComparisonModelLoadingState();

  @override
  Future<void> close() {
    _subscription?.cancel();
    comparisonModelRepository?.dispose();
    return super.close();
  }
}
