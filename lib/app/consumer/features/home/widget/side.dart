import 'package:know_go/imports/app_imports.dart';

class Sidebar extends StatelessWidget {
  final VoidCallback onClose;

  const Sidebar({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onClose,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: AppColors.appColor,
                  padding: const EdgeInsets.all(16),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.appWhite,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const CircleAvatar(radius: 30, backgroundColor: Colors.pink),
          const SizedBox(height: 5),
          const Text(
            'Rahul',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const Text(
            'sky.rahul234@gmail.com',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            child: const Text(
              'View activity',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 32),
          _buildMenuItem(Icons.star_border_purple500_rounded, 'Ratings'),
          _buildMenuItem(Icons.shopping_bag_outlined, 'Orders'),
          _buildMenuItem(Icons.favorite_border_rounded, 'Favorite Orders'),
          _buildMenuItem(Icons.book_outlined, 'Address Book'),
          _buildMenuItem(Icons.settings, 'Settings'),
          _buildMenuItem(Icons.support, 'Legal Support'),
          _buildMenuItem(Icons.info_outline_rounded, 'About'),
          const Divider(),
          const SizedBox(height: 20),
          const Text(
            'Send feedback',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 10),
          const Text(
            'Report a Safety Emergency',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 10),
          const Text(
            'Rate us on App Store',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 10),
          const Text(
            'Log Out',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey.shade300,
            child: Icon(icon, color: Colors.black87, size: 15),
          ),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
