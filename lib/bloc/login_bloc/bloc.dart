import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/user_repository.dart';
import 'event.dart';

import 'state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(LoginState.initial()) {
    on<LoginWithApplePressed>(
        (LoginWithApplePressed event, Emitter<LoginState> emit) async {
      emit(LoginState.loading());
      try {
        final UserCredential? user = await _userRepository.signInWithApple();
        if (user!.user!.uid.isNotEmpty) {
          emit(LoginState.success());
        }
      } catch (_) {
        emit(LoginState.failure());
      }
    });

    on<LoginWithGooglePressed>(
        (LoginWithGooglePressed event, Emitter<LoginState> emit) async {
      emit(LoginState.loading());
      try {
        final UserCredential? user = await _userRepository.signInWithGoogle();
        if (user!.user!.uid.isNotEmpty) {
          emit(LoginState.success());
        }
      } catch (_) {
        emit(LoginState.failure());
      }
    });
    on<LoginAnonymousPressed>(
        (LoginAnonymousPressed event, Emitter<LoginState> emit) async {
      emit(LoginState.loading());
      try {
        final UserCredential? user = await _userRepository.signInAnonymous();
        if (user!.user!.uid.isNotEmpty) {
          emit(LoginState.success());
        }
      } catch (_) {
        emit(LoginState.failure());
      }
    });
  }
  final UserRepository _userRepository;
}
