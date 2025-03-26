import 'package:know_go/imports/app_imports.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({super.key});

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
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
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: Texts.myAddresses,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      overlayColor: AppColors.appGray,
                    ),
                    onPressed: () {
                      _showInputDialog(context);
                    },
                    child: Text(
                      '+ Add Address',
                      style: TextStyle(color: Colors.red),
                    ),
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
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 35),
        child: Column(
          spacing: 16,
          children: [
            Text(
              Texts.savedAddresses.toUpperCase(),
              style: TextStyle(letterSpacing: 9),
            ),
            _buildAddressCard(),
            _buildAddressCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.appGray,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: 'Home',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                AppText(
                  fontSize: 10,
                  title:
                      'Lorem Ipsumes simplemente el texto de relleno de las imprentas y archivos de texto',
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    IconButton(
                      onPressed: () {
                        _showDeleteDialog(context);
                      },
                      icon: Icon(Icons.more_vert),
                      style: IconButton.styleFrom(
                        minimumSize: Size(14, 14),
                        overlayColor: AppColors.appGray,
                        iconSize: 20,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: AppColors.appDarkGray.withValues(
                          alpha: 0.2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share),
                      style: IconButton.styleFrom(
                        overlayColor: AppColors.appGray,
                        iconSize: 20,
                        minimumSize: Size(16, 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showInputDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String title = titleController.text;
                String description = descriptionController.text;
                print('Title: $title, Description: $description');
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Details'),
          actions: [
            TextButton(
              onPressed: () => _showInputDialog(context),
              child: Text('update'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('cancel'),
            ),
          ],
        );
      },
    );
  }
}
