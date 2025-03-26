// part of 'delivery_feedback_bloc.dart';

// class DeliveryFeedbackBloc extends Bloc<DeliveryFeedbackEvent, DeliveryFeedbackState> {
//   DeliveryFeedbackBloc() : super(DeliveryFeedbackState());

//   @override
//   Stream<DeliveryFeedbackState> mapEventToState(DeliveryFeedbackEvent event) async* {
//     if (event is NextStep) {
//       yield state.copyWith(currentStep: state.currentStep + 1);
//     } else if (event is UpdateRating) {
//       yield state.copyWith(rating: event.rating);
//     } else if (event is UpdateAdditionalFeedback) {
//       yield state.copyWith(additionalFeedback: event.feedback);
//     }
//   }
// }
