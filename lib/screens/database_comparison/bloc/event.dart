import 'package:equatable/equatable.dart';

import '../../../models/comparison_model/comparison_model.dart';

abstract class QuestionsEvent extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class AnswersSelected extends QuestionsEvent {
  AnswersSelected(this.question, this.answer);
  final String? question;
  final String? answer;

  @override
  List<Object?> get props => <Object?>[question, answer];
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
    };
  }
}

class AnswersSubmitted extends QuestionsEvent {
  AnswersSubmitted({required this.answerSelected});

  final List<AnswersSelected> answerSelected;

  @override
  List<Object> get props => <Object>[answerSelected];
}

class SolutionViewed extends QuestionsEvent {
  SolutionViewed({required this.model});

  final ComparisonModel model;

  @override
  List<Object> get props => <Object>[model];
}
