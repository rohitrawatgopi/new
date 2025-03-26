import 'package:know_go/app/consumer/features/auth/signup/ui/signup.dart';
import 'package:know_go/app/consumer/features/common/coming_soon.dart';
import 'package:know_go/app/consumer/menu/about/ui/about.dart';
import 'package:know_go/app/consumer/menu/address/ui/address.dart';
import 'package:know_go/app/consumer/menu/chat_request/ui/chat.dart';
import 'package:know_go/app/consumer/menu/fav/ui/favourite.dart';
import 'package:know_go/app/consumer/menu/orders/ui/orders.dart';
import 'package:know_go/app/consumer/menu/setting/ui/setting.dart';
import 'package:know_go/imports/app_imports.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: _showProfileDrawer(context),
    );
  }

  Widget _showProfileDrawer(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 68,
                    width: 68,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: const CircleAvatar(
                      radius: 68,
                      backgroundImage: NetworkImage(
                        'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(Size(48, 48)),
                      iconSize: WidgetStateProperty.all(24),
                      backgroundColor: WidgetStateProperty.all(
                        AppColors.appColor,
                      ),
                    ),
                  ),
                ],
              ),
              const AppText(
                title: 'Rahul',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const Divider(),
              SizedBox(height: 10),
              buildListTile(
                context,
                leadingIcon: Icons.wallet,
                title: 'Wallet',
                destination: PlaceholderPage(title: 'Wallet'),
                onTap: () => navigateTo(context: context, to: ComingSoon()),
              ),
              SizedBox(height: 10),
              buildListTile(
                context,
                leadingIcon: Icons.shopping_bag_outlined,
                title: 'Order Summary',
                destination: PlaceholderPage(title: 'Orders'),
                iconBackgroundColor: AppColors.appGray,
                onTap: () => navigateTo(context: context, to: OrdersPage()),
              ),
              SizedBox(height: 10),
              buildListTile(
                context,
                leadingIcon: Icons.favorite_border,
                title: 'Favorite Orders',
                destination: PlaceholderPage(title: 'Favorite Orders'),
                onTap:
                    () =>
                        navigateTo(context: context, to: FavouriteOrdersPage()),
              ),
              SizedBox(height: 10),
              buildListTile(
                context,
                leadingIcon: Icons.contact_mail_outlined,
                title: 'Address Book',
                destination: PlaceholderPage(title: 'Address Book'),
                onTap: () => navigateTo(context: context, to: AddressesPage()),
              ),
              SizedBox(height: 10),
              buildListTile(
                context,
                leadingIcon: Icons.settings,
                title: 'Settings',
                destination: PlaceholderPage(title: 'Settings'),
                onTap: () {
                  navigateTo(context: context, to: SettingsPage());
                },
              ),
              SizedBox(height: 10),
              buildListTile(
                context,
                leadingIcon: Icons.chat,
                title: 'Chat History',
                destination: PlaceholderPage(title: 'Chat History'),
                onTap:
                    () => navigateTo(context: context, to: ChatRequestPage()),
              ),
              SizedBox(height: 10),
              buildListTile(
                context,
                leadingIcon: Icons.info_outline,
                title: 'About Us',
                destination: PlaceholderPage(title: 'About '),
                onTap: () => navigateTo(context: context, to: AboutPage()),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              const Divider(),
              SizedBox(height: 10),
              AppText(title: "Rate us on App Store", color: Colors.grey),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ConsumerSignup()),
                    (route) => false, // This removes all previous routes
                  );
                },
                child: AppText(title: "Log Out", color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(
    BuildContext context, {
    IconData? trailingIcon,
    IconData? leadingIcon,
    required String title,
    required Widget destination,
    Color iconBackgroundColor = AppColors.appGray,
    Function()? onTap,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        iconColor: AppColors.appBlack,
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
      ),
      onPressed:
          onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 16,
        children: [
          if (leadingIcon != null)
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconBackgroundColor,
              ),
              child: Icon(leadingIcon),
            ),
          AppText(title: title, color: AppColors.appBlack, fontSize: 16),
          if (trailingIcon != null) Icon(trailingIcon),
        ],
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('This is the $title page')),
    );
  }
}
