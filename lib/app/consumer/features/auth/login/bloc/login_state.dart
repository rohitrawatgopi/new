part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginActionState extends LoginState {}

class LoginFailState extends LoginActionState {
  final String error;

  LoginFailState({required this.error});
}

class LoginSuccessState extends LoginActionState {}
