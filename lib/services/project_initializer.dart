import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_observer/custom_bloc_observer.dart';

Future<String> projectInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = CustomBlocObserver();

  return 'initialized';
}
