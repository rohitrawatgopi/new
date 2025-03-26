import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'thank_you_event.dart';
part 'thank_you_state.dart';

class ThankYouBloc extends Bloc<ThankYouEvent, ThankYouState> {
  ThankYouBloc() : super(ThankYouInitial()) {
    on<StartNavigationEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));
      emit(NavigateToHomeState());
    });
  }
}
