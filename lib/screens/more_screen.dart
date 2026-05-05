import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'board_screen.dart';
import 'contact_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("More")),
      body: ListView(
        children: [
          _tile(context, "About Us", const AboutScreen()),
          _tile(context, "Board", const BoardScreen()),
          _tile(context, "Contact", const ContactScreen()),
        ],
      ),
    );
  }

  Widget _tile(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
    );
  }
}