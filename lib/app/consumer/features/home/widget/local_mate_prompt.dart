import 'package:know_go/imports/app_imports.dart';

class LocalMatePrompt extends StatelessWidget {
  final double hg;
  const LocalMatePrompt({super.key, required this.hg});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(left: 33, bottom: hg / 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 5),
            Flexible(
              child: AppText(
                title: "Unsure of the location? Connect with a localMate",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
