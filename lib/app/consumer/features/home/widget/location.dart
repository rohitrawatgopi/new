import 'package:know_go/imports/app_imports.dart';

void showLocationBottomSheet({
  required BuildContext context,
  required Function(String) onLocationSelected,
}) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: AppColors.appWhite,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.88,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              AppText(
                title: 'Choose Destination',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.appColor,
              ),
              const SizedBox(height: 16),
              AppTextField(
                onChanged: (value) {
                  // Implement location search filtering here
                },
                hintText: 'Select Location',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildLocationItem(
                      label: 'Work',
                      address: 'Nimra’s Office',
                      onTap: () => onLocationSelected('Work'),
                    ),
                    _buildLocationItem(
                      label: 'Home',
                      address: '234 Palm Oasis, Mumbai',
                      onTap: () => onLocationSelected('Home'),
                    ),
                    _buildLocationItem(
                      label: 'Saved',
                      address: '321 Pearl Lane, Mumbai',
                      onTap: () => onLocationSelected('Saved Location 1'),
                    ),
                    _buildLocationItem(
                      label: 'Saved',
                      address: '395 Whit Whitman St., Mumbai',
                      onTap: () => onLocationSelected('Saved Location 2'),
                    ),
                    const Divider(color: Colors.grey, thickness: 1, height: 32),
                    InkWell(
                      onTap: () => onLocationSelected('Choose from Map'),
                      child: Row(
                        children: [
                          Icon(Icons.map, color: AppColors.appColor, size: 24),
                          const SizedBox(width: 8),
                          Expanded(
                            child: AppText(
                              title: 'Choose from maps',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.appColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  onLocationSelected('Save New Location');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.appColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AppText(
                    title: 'Save New Location',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// **Reused `_buildLocationItem` Method**
Widget _buildLocationItem({
  required String label,
  required String address,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(Icons.place, color: AppColors.appColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: label,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.appColor,
                ),
                const SizedBox(height: 4),
                AppText(
                  title: address,
                  fontSize: 12,
                  color: AppColors.appColor,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
