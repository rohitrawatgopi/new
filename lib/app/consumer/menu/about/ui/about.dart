import 'package:know_go/imports/app_imports.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: Padding(
          padding: EdgeInsets.only(left: 32, right: 32, top: 52),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: Texts.about,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(48, 48)),
                  backgroundColor: WidgetStateProperty.all(AppColors.appColor),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 35),
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title: Texts.termsOfService,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            Divider(),
            AppText(
              title: Texts.appVersion,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            AppText(
              title: 'v13.45 beta',
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            Divider(),
            AppText(
              title: Texts.licenseRegistration,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
