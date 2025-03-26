import 'package:flutter/material.dart';

class CallList extends StatelessWidget {
  const CallList({super.key});

  void _showDropdownDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select an Option"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(4, (index) {
              int number = index + 1;
              return ListTile(
                subtitle: const Text(
                  "on Going",
                  style: TextStyle(color: Colors.red),
                ),
                trailing: const Icon(Icons.info_outline_rounded),
                title: Text("Cart $number"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/chat');
                },
              );
            }),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert), // 3-dot menu icon
      onPressed: () => _showDropdownDialog(context),
    );
  }
}
