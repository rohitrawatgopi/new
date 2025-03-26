import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial(selectedCategories: [])) {
    on<ToggleCategorySelectionEvent>((event, emit) {
      final currentState = state as CategoryInitial;
      List<String> updatedSelection = List.from(
        currentState.selectedCategories,
      );

      if (updatedSelection.contains(event.title)) {
        updatedSelection.remove(event.title);
      } else {
        updatedSelection.add(event.title);
      }

      emit(CategoryInitial(selectedCategories: updatedSelection));
    });

    on<ProceedToNextScreenEvent>((event, emit) {
      final currentState = state as CategoryInitial;
      if (currentState.selectedCategories.isNotEmpty) {
        emit(NavigateToNextScreenState());
      }
    });
  }
}
