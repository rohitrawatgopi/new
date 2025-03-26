import 'package:know_go/imports/app_imports.dart';

class CustomCarouselSlider extends StatefulWidget {
  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final List<Map<String, String>> carouselItems = [
    {
      "image": "assets/images/info1.png",
      "title": "Shopping & Product Delivery",
      "description":
          "Whether it's a quick errand, a small repair, or assistance\n"
          "with a task, our Local Mates are here to help with a range...",
    },
    {
      "image": "assets/images/info2.png",
      "title": "Information",
      "description":
          "Need something delivered fast? Our Local Mates can pick\n"
          "up and deliver products from nearby stores or markets...",
    },
    {
      "image": "assets/images/info3.png",
      "title": "Services",
      "description":
          "Whether it's a quick errand, a small repair, or assistance\n"
          "with a task, our Local Mates are here to help with a range...",
    },
    {
      "image": "assets/images/info4.png",
      "title": "Live Location Status",
      "description":
          "Get real-time updates about your destination or point of\n"
          "interest. Whether it's checking if a shop is open, how...",
    },
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items:
              carouselItems.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item["image"]!,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: AppText(
                                title: item["title"]!,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            AppText(title: item["description"]!, fontSize: 10),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
          options: CarouselOptions(
            height: 250,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            carouselItems.length,
            (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 12 : 8,
              height: _currentPage == index ? 12 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
