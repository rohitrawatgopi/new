part of 'delivery_feedback_event.dart';

abstract class DeliveryFeedbackEvent {}

class NextStep extends DeliveryFeedbackEvent {}

class UpdateRating extends DeliveryFeedbackEvent {
  final double rating;
  UpdateRating(this.rating);
}

class UpdateAdditionalFeedback extends DeliveryFeedbackEvent {
  final String feedback;
  UpdateAdditionalFeedback(this.feedback);
}
