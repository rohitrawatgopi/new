import 'package:know_go/imports/app_imports.dart';

class FavouriteOrdersPage extends StatefulWidget {
  const FavouriteOrdersPage({super.key});

  @override
  State<FavouriteOrdersPage> createState() => _FavouriteOrdersPageState();
}

class _FavouriteOrdersPageState extends State<FavouriteOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: Padding(
          padding: EdgeInsets.only(left: 32, right: 32, top: 52),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  AppText(
                    title: Texts.favouriteOrders,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ],
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/page.png"),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shopping & Product ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.star, color: Colors.yellow),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildImagePlaceholder(),
                      _buildImagePlaceholder(),
                      const SizedBox(width: 8),
                      const Text(
                        '+2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Order placed on 3rd Nov\n, 8:10PMDelivered',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          const Text(
                            '₹500.00',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Add your button action here
                            },
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Center(
                                child: const Text(
                                  'Reorder',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildFavouriteOrderCard({
    String? image,
    title,
    shopName,
    orderDate,
    status,
    amount,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.appGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.appDarkGray.withValues(alpha: 0.3),
                  image: DecorationImage(
                    onError: (exception, stackTrace) {
                      debugPrint("OrdesPage: Image loading error: $exception");
                    },
                    image: NetworkImage(image ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        title: title,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(width: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                    ],
                  ),
                  AppText(title: shopName),
                ],
              ),
            ],
          ),
          Divider(height: 20),
          AppText(
            title: 'Order placed on $orderDate',
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(title: status, fontSize: 11, fontWeight: FontWeight.w500),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  Text(
                    '₹$amount.00',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppButton(
                    radius: 11,
                    color: AppColors.appColor,
                    hight: 30,
                    width: 120,
                    title: 'Reorder',
                    fontSize: 11,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
