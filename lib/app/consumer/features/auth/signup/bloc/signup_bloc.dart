import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc()
    : super(SignupCheckboxState(isChecked: false, isAgeChecked: false)) {
    on<ToggleCheckboxEvent>(toggleCheckboxEvent);
    on<SubmitSignupEvent>(submitSignupEvent);
  }

  FutureOr<void> toggleCheckboxEvent(
    ToggleCheckboxEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(
      SignupCheckboxState(
        isChecked: event.isChecked,
        isAgeChecked: event.isAgeChecked,
      ),
    );
  }

  FutureOr<void> submitSignupEvent(
    SubmitSignupEvent event,
    Emitter<SignupState> emit,
  ) {
    if (event.name.isEmpty || event.phoneNumber.isEmpty) {
      emit(SignupFailState(error: "Please fill in all fields"));
    } else if (event.phoneNumber.length < 10) {
      emit(SignupFailState(error: "Please enter a valid phone number"));
    } else if (!event.isChecked) {
      emit(SignupFailState(error: "You must agree to the Terms of Use"));
    } else if (!event.isAgeChecked) {
      emit(SignupFailState(error: "You must confirm that you are 18+"));
    } else {
      emit(SignupSuccessState());
    }
  }
}
