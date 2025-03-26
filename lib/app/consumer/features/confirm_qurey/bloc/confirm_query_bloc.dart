import 'package:bloc/bloc.dart';
import 'package:know_go/app/consumer/features/confirm_qurey/bloc/confirm_query_state.dart';
import 'package:meta/meta.dart';

part 'confirm_query_event.dart';

class ConfirmQueryBloc extends Bloc<ConfirmQueryEvent, ConfirmQueryState> {
  ConfirmQueryBloc(String initialQuery)
    : super(ConfirmQueryInitial(queryText: initialQuery)) {
    on<ToggleEstimatedPriceEvent>((event, emit) {
      final currentState = state as ConfirmQueryInitial;
      emit(
        ConfirmQueryInitial(
          showEstimatedPrice: !currentState.showEstimatedPrice,
          isEditing: currentState.isEditing,
          isEditingPrice: currentState.isEditingPrice,
          queryText: currentState.queryText,
          price: currentState.price,
        ),
      );
    });

    on<ToggleEditingEvent>((event, emit) {
      final currentState = state as ConfirmQueryInitial;
      emit(
        ConfirmQueryInitial(
          showEstimatedPrice: currentState.showEstimatedPrice,
          isEditing: !currentState.isEditing,
          isEditingPrice: currentState.isEditingPrice,
          queryText: currentState.queryText,
          price: currentState.price,
        ),
      );
    });

    on<UpdateQueryTextEvent>((event, emit) {
      final currentState = state as ConfirmQueryInitial;
      emit(
        ConfirmQueryInitial(
          showEstimatedPrice: currentState.showEstimatedPrice,
          isEditing: currentState.isEditing,
          isEditingPrice: currentState.isEditingPrice,
          queryText: event.queryText,
          price: currentState.price,
        ),
      );
    });

    on<UpdatePriceEvent>((event, emit) {
      final currentState = state as ConfirmQueryInitial;
      emit(
        ConfirmQueryInitial(
          showEstimatedPrice: currentState.showEstimatedPrice,
          isEditing: currentState.isEditing,
          isEditingPrice: currentState.isEditingPrice,
          queryText: currentState.queryText,
          price: event.price,
        ),
      );
    });
  }
}
