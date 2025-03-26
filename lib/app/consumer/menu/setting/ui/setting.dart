// import 'package:know_go/app/consumer/features/auth/signup/ui/signup.dart';
// import 'package:know_go/imports/app_imports.dart';

// class AccSetting extends StatelessWidget {
//   const AccSetting({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // Header
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Account Settings',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(
//                       Icons.arrow_back_ios_new_sharp,
//                       color: Colors.white,
//                     ),
//                     style: ButtonStyle(
//                       minimumSize: WidgetStateProperty.all(const Size(48, 48)),
//                       backgroundColor: WidgetStateProperty.all(
//                         AppColors.appColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),

//               // Settings Options
//               // ListTile(
//               //   contentPadding: EdgeInsets.zero,
//               //   title: const Text('Change email'),
//               //   trailing: const Icon(Icons.chevron_right),
//               //   onTap: () {
//               //     // Handle email change
//               //     print('Change email tapped');
//               //   },
//               // ),
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 title: Text(
//                   'Delete Account',
//                   style: TextStyle(color: Colors.red[600]),
//                 ),
//                 trailing: const Icon(Icons.chevron_right),
//                 onTap: () {
//                   _showDeleteDialog(context);
//                   // Handle account deletion
//                   print('Delete account tapped');
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showDeleteDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Are you sure 😒😒'),
//           actionsAlignment: MainAxisAlignment.center,
//           actions: [
//             TextButton(onPressed: () => ConsumerSignup(), child: Text('Yes')),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('No'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:know_go/imports/app_imports.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                title: Texts.accountSettings,
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
            GestureDetector(
              onTap: () {
                //   navigateTo(context: context, to: ProfileScreen());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: Texts.editProfile,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  AppText(
                    title: Texts.editProfileSubTitle,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                //       navigateTo(context: context, to: AccSetting());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: Texts.accountSettings,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  InkWell(
                    onTap: () {},
                    child: AppText(
                      title: Texts.deleteAccount,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
