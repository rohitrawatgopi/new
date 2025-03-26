part of 'confirm_query_bloc.dart';

@immutable
abstract class ConfirmQueryEvent {}

class ToggleEstimatedPriceEvent extends ConfirmQueryEvent {}

class ToggleEditingEvent extends ConfirmQueryEvent {}

class UpdateQueryTextEvent extends ConfirmQueryEvent {
  final String queryText;
  UpdateQueryTextEvent(this.queryText);
}

class UpdatePriceEvent extends ConfirmQueryEvent {
  final String price;
  UpdatePriceEvent(this.price);
}
