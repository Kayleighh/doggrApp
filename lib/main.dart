import 'package:doggr2/bloc/authentification/authentification_bloc.dart';
import 'package:doggr2/bloc/blocDelegate.dart';
import 'package:doggr2/repositories/userRepository.dart';
import 'package:doggr2/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bloc/authentification/authentification_event.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final UserRepository _userRepository = UserRepository();

  Bloc.observer = SimpleBlocDelegate();

  runApp(BlocProvider(
    create: (context) => AuthentificationBloc(_userRepository)
        ..add(AppStarted()),
      child: Home(userRepository: _userRepository)));
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doggr Login test',
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: Home(userRepository: _userRepository,),
    );
  }
}