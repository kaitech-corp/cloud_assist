import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../../../services/firebase_functions/firebase_functions.dart';
import 'event.dart';
import 'state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc() : super(QuestionsState.submitting()) {
    on<AnswersSubmitted>(
        (AnswersSubmitted event, Emitter<QuestionsState> emit) async {
      if (event.answerSelected.isNotEmpty) {
        emit(QuestionsState.submitting());
        try {
          FirestoreDatabase().saveAnswers(event.answerSelected);
          emit(QuestionsState.success(answerSelected: event.answerSelected));
        } catch (e) {
          emit(QuestionsState.failure());
        }
      } else {
        emit(QuestionsState.failure());
      }
    });
    on<AnswersSelected>(
        (AnswersSelected event, Emitter<QuestionsState> emit) async {
      final AnswersSelected newSelectedAnswer =
          AnswersSelected(event.question, event.answer);
      final QuestionsState currentState = state;
      final List<AnswersSelected> updatedSelectedAnswers =
          List<AnswersSelected>.from(currentState.answerSelected);
      final int existingAnswerIndex = updatedSelectedAnswers.indexWhere(
        (AnswersSelected answer) =>
            answer.question == newSelectedAnswer.question,
      );
      if (existingAnswerIndex >= 0) {
        updatedSelectedAnswers[existingAnswerIndex] = newSelectedAnswer;
      } else {
        updatedSelectedAnswers.add(newSelectedAnswer);
      }
      emit(currentState.copyWith(answerSelected: updatedSelectedAnswers));
    });
    on<SolutionViewed>(
        (SolutionViewed event, Emitter<QuestionsState> emit) async {
      emit(QuestionsState.submitting());
    });
  }
}
