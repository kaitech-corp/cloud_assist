import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentication_bloc/authentication_bloc.dart';
import '../../bloc/authentication_bloc/authentication_event.dart';
import '../../bloc/authentication_bloc/authentication_state.dart';
import '../../repositories/user_repository.dart';
import '../../services/service_config/service_config.dart';
import '../home/home.dart';
import '../login/login_screen.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  RootPageState createState() => RootPageState();
}

class RootPageState extends State<RootPage> {
  final UserRepository userRepository = UserRepository();
  late AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _authenticationBloc.add(AuthenticationStarted());
  }

  @override
  void dispose() {
    _authenticationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      bloc: _authenticationBloc,
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationSuccess) {
          return const Home();
        } else if(state is AuthenticationFailure) {
          return LoginScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
