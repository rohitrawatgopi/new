part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

/// 🔹 **Combined Event to Toggle Both Checkboxes**
class ToggleCheckboxEvent extends SignupEvent {
  final bool isChecked;
  final bool isAgeChecked;

  ToggleCheckboxEvent({required this.isChecked, required this.isAgeChecked});
}

class SubmitSignupEvent extends SignupEvent {
  final String name;
  final String phoneNumber;
  final bool isChecked;
  final bool isAgeChecked;

  SubmitSignupEvent({
    required this.name,
    required this.phoneNumber,
    required this.isChecked,
    required this.isAgeChecked,
  });
}
