import 'package:flutter/material.dart';
import 'package:minimal_chat_app/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout() async {
    final AuthService auth = AuthService();
    auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [IconButton(onPressed: _logout, icon: Icon(Icons.logout))],
      ),
    );
  }
}
