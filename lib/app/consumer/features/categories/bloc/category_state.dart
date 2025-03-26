abstract class CategoryState {}

class CategoryInitial extends CategoryState {
  final List<String> selectedCategories;

  CategoryInitial({required this.selectedCategories});
}

class NavigateToNextScreenState extends CategoryState {}
