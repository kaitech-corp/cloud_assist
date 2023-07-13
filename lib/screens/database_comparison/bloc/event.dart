import 'package:equatable/equatable.dart';

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

class SolutionViewed extends QuestionsEvent {}
