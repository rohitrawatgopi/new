import 'package:know_go/imports/app_imports.dart';

class LocationFields extends StatelessWidget {
  final HomeState state;
  const LocationFields({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            AppTextField(
              onTap: () => _showLocationBottomSheet(context, isCurrent: true),
              borderRadius: 12,
              readOnly: true,
              hintText: state.currentLocation ?? 'Current Location',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: AppColors.appBlack,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            AppTextField(
              onTap: () => _showLocationBottomSheet(context, isCurrent: false),
              readOnly: true,
              borderRadius: 12,
              hintText: state.interestedLocation ?? 'Interested In',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: AppColors.appBlack,
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 34,
          left: 24,
          child: Container(width: 2, height: 52, color: AppColors.appBlack),
        ),
      ],
    );
  }

  void _showLocationBottomSheet(
    BuildContext context, {
    required bool isCurrent,
  }) {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Container(
            height: 300,
            child: Center(child: Text("Location Picker")),
          ),
    );
  }
}
