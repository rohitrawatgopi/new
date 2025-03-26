import 'package:flutter/material.dart';

class ShowTwoLocalMateDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildListTile("Vikas"),
                _buildListTile("Amit"),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => Navigator.pop(context), // Close the dialog
                  child: const Text("Close"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildListTile(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        child: ListTile(
          leading: const CircleAvatar(),
          title: Text(name),
          trailing: const Icon(Icons.call),
        ),
      ),
    );
  }
}
