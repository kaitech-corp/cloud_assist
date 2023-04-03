import 'package:equatable/equatable.dart';

abstract class QuestionsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AnswersSelected extends QuestionsEvent {
  final String? question;
  final String? answer;

  AnswersSelected(this.question, this.answer);

  @override
  List<Object?> get props => [question, answer];
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
  List<Object> get props => [answerSelected];
}

class SolutionViewed extends QuestionsEvent {}
