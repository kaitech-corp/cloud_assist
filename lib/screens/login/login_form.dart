import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../bloc/authentication_bloc/authentication_bloc.dart';
import '../../bloc/authentication_bloc/authentication_event.dart';
import '../../bloc/login_bloc/bloc.dart';
import '../../bloc/login_bloc/event.dart';

import '../../bloc/login_bloc/state.dart';
import '../../repositories/user_repository.dart';
import '../../services/constants.dart';
import '../../services/ui/text_styles.dart';
import 'components/alert_dialog.dart';

/// Form for login screen
class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isAppleLoginButtonEnabled(LoginState state) {
    return !state.isSubmitting;
  }

  bool isGoogleLoginButtonEnabled(LoginState state) {
    return !state.isSubmitting;
  }

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        listenerMethod(state, context);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: BlocBuilder<LoginBloc, LoginState>(
            bloc: _loginBloc,
            builder: (BuildContext context, LoginState state) {
              return Column(children: <Widget>[
                Column(
                  children: <Widget>[
                    IntrinsicWidth(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              if (isGoogleLoginButtonEnabled(state)) {
                                _onPressedGoogleSignIn();
                              }
                            },
                            style: ElevatedButtonTheme.of(context)
                                .style
                                ?.copyWith(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white),shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Image(
                                      image: AssetImage(google_logo),
                                      height: 30.0),
                                  Text(signInWithGoogle,style: titleLarge(context)),
                                ],
                              ),
                            ),
                          ),
                          if (UserRepository().appleSignInAvailable)
                            const SizedBox(
                              height: 16,
                            ),
                          if (UserRepository().appleSignInAvailable)
                            SignInWithAppleButton(onPressed: () {
                              if (isAppleLoginButtonEnabled(state)) {
                                _onPressedAppleSignIn();
                              }
                            }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    // GradientButton(
                    //   width: 150,
                    //   height: 45,
                    //   onPressed: () {
                    //     if (true) {
                    //       // _onFormSubmitted();
                    //     }
                    //   },
                    //   text: Text(
                    //     'Home',
                    //     style: titleLarge(context)?.copyWith(color: Colors.white),
                    //   ),
                    //   icon: const Icon(
                    //     Icons.home,
                    //     color: Colors.black,
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8.0, 16),
                        child: TextButton(
                          child:  Text('Forgot Password',style: titleLarge(context)?.copyWith(color: Colors.blue,fontStyle: FontStyle.italic),),
                          onPressed: () {
                            resetPasswordAlertDialog(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }



  void listenerMethod(LoginState state, BuildContext context) {
    if (state.isFailure) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Login failed',style: titleMedium(context),),
                const Icon(Icons.error),
              ],
            ),
            backgroundColor: Colors.blueGrey[200],
          ),
        );
    }

    if (state.isSubmitting) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text('Logging in...'),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              ],
            ),
            backgroundColor: Colors.blueGrey[200],
          ),
        );
    }

    if (state.isSuccess) {
      BlocProvider.of<AuthenticationBloc>(context).add(
        AuthenticationLoggedIn(),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onPressedAppleSignIn() {
    _loginBloc.add(LoginWithApplePressed());
  }

  void _onPressedGoogleSignIn() {
    _loginBloc.add(LoginWithGooglePressed());
  }
}
