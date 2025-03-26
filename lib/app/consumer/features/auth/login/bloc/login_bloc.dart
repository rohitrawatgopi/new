import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SubmitLoginEvent>(submitLoginEvent);
  }

  FutureOr<void> submitLoginEvent(
    SubmitLoginEvent event,
    Emitter<LoginState> emit,
  ) {
    if (event.phoneNumber.length < 10) {
      emit(LoginFailState(error: "please enter valid number "));
    }
  }
}
