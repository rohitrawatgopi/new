part of 'delivery_feedback_state.dart';

class DeliveryFeedbackState {
  final int currentStep;
  final double rating;
  final String additionalFeedback;

  DeliveryFeedbackState({
    this.currentStep = 0,
    this.rating = 0.0,
    this.additionalFeedback = '',
  });

  DeliveryFeedbackState copyWith({
    int? currentStep,
    double? rating,
    String? additionalFeedback,
  }) {
    return DeliveryFeedbackState(
      currentStep: currentStep ?? this.currentStep,
      rating: rating ?? this.rating,
      additionalFeedback: additionalFeedback ?? this.additionalFeedback,
    );
  }
}
