import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

class LoginSkipPressed extends LoginEvent {
  LoginSkipPressed();
  @override
  List<Object> get props => <Object>[];
}

class LoginWithApplePressed extends LoginEvent {
  LoginWithApplePressed();

  @override
  List<Object> get props => <Object>[];
}

class LoginWithGooglePressed extends LoginEvent {
  LoginWithGooglePressed();

  @override
  List<Object> get props => <Object>[];
}
class LoginAnonymousPressed extends LoginEvent {
  LoginAnonymousPressed();

  @override
  List<Object> get props => <Object>[];
}
