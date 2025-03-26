abstract class CategoryEvent {}

class ToggleCategorySelectionEvent extends CategoryEvent {
  final String title;
  ToggleCategorySelectionEvent(this.title);
}

class ProceedToNextScreenEvent extends CategoryEvent {}
