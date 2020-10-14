
import 'package:equatable/equatable.dart';
abstract class AuthentificationEvent extends Equatable {
  const AuthentificationEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthentificationEvent {}

class LoggedIn extends AuthentificationEvent {}

class LoggedOut extends AuthentificationEvent {}
