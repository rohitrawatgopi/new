import 'package:know_go/imports/app_imports.dart';

class ChatRequestPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat History"),
        actions: [
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Request Form For Your History"),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Enter your request",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Request Sent: ${_controller.text}");
              },
              child: Text("Send Request"),
            ),
          ],
        ),
      ),
    );
  }
}
