import 'event.dart';

class QuestionsState {

  QuestionsState({
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    required this.answerSelected,
  });
  factory QuestionsState.failure() {
    return QuestionsState(
        isSubmitting: false, isSuccess: false, isFailure: true, answerSelected: <AnswersSelected>[]);
  }

  factory QuestionsState.success({required List<AnswersSelected> answerSelected}) {
    return QuestionsState(
        isSubmitting: false, isSuccess: true, isFailure: false, answerSelected: answerSelected);
  }

  factory QuestionsState.submitting() {
    return QuestionsState(
        isSubmitting: true, isSuccess: false, isFailure: false, answerSelected: <AnswersSelected>[]);
  }

  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final List<AnswersSelected> answerSelected;

  QuestionsState update({
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    int? index,
    List<AnswersSelected>? answerSelected,
  }) {
    return copyWith(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      answerSelected: answerSelected ?? this.answerSelected,
    );
  }

  QuestionsState copyWith({
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    List<AnswersSelected>? answerSelected,
  }) {
    return QuestionsState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      answerSelected: answerSelected ?? this.answerSelected,
    );
  }
}
