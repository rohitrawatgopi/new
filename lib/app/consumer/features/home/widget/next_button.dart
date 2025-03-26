import 'package:know_go/imports/app_imports.dart';

class NextButton extends StatelessWidget {
  final HomeState state;
  const NextButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 68,
      child: GestureDetector(
        onTap: () {
          context.read<HomeBloc>().add(
            NavigateToCategoryEvent(
              state.currentLocation ?? '',
              state.interestedLocation ?? '',
            ),
          );
        },
        child: Card(
          color: AppColors.appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Center(
            child: Icon(Icons.arrow_forward, color: AppColors.appWhite),
          ),
        ),
      ),
    );
  }
}
