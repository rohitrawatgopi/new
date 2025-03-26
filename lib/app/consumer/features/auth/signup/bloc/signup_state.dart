part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

/// 🔹 **Combined Checkbox State**
class SignupCheckboxState extends SignupState {
  final bool isChecked;
  final bool isAgeChecked;

  SignupCheckboxState({required this.isChecked, required this.isAgeChecked});
}

/// 🔹 **Action States for Listener**
abstract class SignupActionState extends SignupState {}

class SignupSuccessState extends SignupActionState {}

class SignupFailState extends SignupActionState {
  final String error;
  SignupFailState({required this.error});
}
