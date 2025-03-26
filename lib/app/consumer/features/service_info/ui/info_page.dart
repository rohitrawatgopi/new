import 'package:know_go/imports/app_imports.dart';

class ServicesInfo extends StatefulWidget {
  const ServicesInfo({super.key});

  @override
  State<ServicesInfo> createState() => _ServicesInfoState();
}

class _ServicesInfoState extends State<ServicesInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
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
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 5),
                child: AppText(
                  title: "What we do",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/info1.png"),
                      SizedBox(height: 5),
                      AppText(
                        title: "Shopping & Product Delivery",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5),
                      AppText(
                        title:
                            "Whether it’s a quick errand, a small repair, or assistance\n"
                            "with a task, our Local Mates are here to help with a range...",
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/info2.png"),
                      SizedBox(height: 5),
                      AppText(
                        title: "Information",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5),
                      AppText(
                        title:
                            "Need something delivered fast? Our Local Mates can pick\n"
                            "up and deliver products from nearby stores or markets...",
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/info3.png"),
                      SizedBox(height: 5),
                      AppText(
                        title: "Services",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5),
                      AppText(
                        title:
                            "Whether it’s a quick errand, a small repair, or assistance\n"
                            "with a task, our Local Mates are here to help with a range...",
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/info4.png"),
                      SizedBox(height: 5),
                      AppText(
                        title: "Live Location Status",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5),
                      AppText(
                        title:
                            "Get real-time updates about your destination or point of\n"
                            "interest. Whether it’s checking  if a shop is open, how...",
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
