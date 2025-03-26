import 'package:know_go/imports/app_imports.dart';

final List<Map<String, String>> _categories = [
  {
    'title': "Shopping & Product Delivery",
    'description':
        "Whether it’s a quick errand, a small repair, or assistance with a task, our Local Mates are here to help with a range of personalized services tailored to your needs.",
  },
  {
    'title': "Information",
    'description':
        "Need something delivered fast? Our Local Mates can pick up and deliver products from nearby stores or markets directly to your location. It’s fast, reliable, and convenient.",
  },
  {
    'title': "Quick Check",
    'description':
        "Access hyper-local, verified information about any place, event, or service. Whether you’re looking for store timings, menu options, or local recommendations, our Local Mates are here to provide quick answers.",
  },
];

class CategoryTile extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTile({
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          tileColor: isSelected ? AppColors.appColor : AppColors.appGray,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: title,
                fontSize: 12,
                color: isSelected ? AppColors.appWhite : AppColors.appBlack,
              ),
              Tooltip(
                message: description,
                child: IconButton(
                  color: isSelected ? AppColors.appWhite : AppColors.appBlack,
                  onPressed: () {
                    _showInfoDialog(context, description);
                  },
                  icon: const Icon(Icons.info_outline_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Text(
            description,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14),
          ),
        );
      },
    );
  }
}
