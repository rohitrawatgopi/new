abstract class ConfirmQueryState {}

class ConfirmQueryInitial extends ConfirmQueryState {
  final bool showEstimatedPrice;
  final bool isEditing;
  final bool isEditingPrice;
  final String queryText;
  final String price;

  ConfirmQueryInitial({
    this.showEstimatedPrice = false,
    this.isEditing = false,
    this.isEditingPrice = false,
    required this.queryText,
    this.price = "₹20-30",
  });
}
