part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SubmitLoginEvent extends LoginEvent {
  final String phoneNumber;

  SubmitLoginEvent({required this.phoneNumber});
}
