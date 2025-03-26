import 'package:know_go/app/consumer/features/categories/bloc/category_bloc.dart';
import 'package:know_go/app/consumer/features/categories/bloc/category_event.dart';
import 'package:know_go/app/consumer/features/categories/bloc/category_state.dart';
import 'package:know_go/app/consumer/features/categories/widget/category_title.dart';
import 'package:know_go/app/utils/floating_button.dart';
import 'package:know_go/constants/category_data.dart';
import 'package:know_go/imports/app_imports.dart';

class CategoryScreen extends StatelessWidget {
  final String currentLocation;
  final String interestedLocation;

  const CategoryScreen({
    Key? key,
    required this.currentLocation,
    required this.interestedLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(),
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is NavigateToNextScreenState) {
            //   navigateTo(context: context, to: QueryScreen());
          }
        },
        builder: (context, state) {
          final categoryBloc = context.read<CategoryBloc>();
          final selectedCategories =
              (state is CategoryInitial) ? state.selectedCategories : [];

          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/banner1.png',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    const AppText(
                      title: "Pick a category.",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: categoryList.length, // Corrected name

                        itemBuilder: (context, index) {
                          final category = categoryList[index];
                          final isSelected = selectedCategories.contains(
                            category['title'],
                          );

                          return CategoryTile(
                            title: category['title']!,
                            description: category['description']!,
                            isSelected: isSelected,
                            onTap: () {
                              categoryBloc.add(
                                ToggleCategorySelectionEvent(
                                  category['title']!,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 120),
                  ],
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: AppColors.appColor,
                      padding: EdgeInsets.all(56 * 0.3),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.appWhite,
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FloatButton(
                icon: Icons.arrow_forward,
                onPressed: () {
                  categoryBloc.add(ProceedToNextScreenEvent());
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
