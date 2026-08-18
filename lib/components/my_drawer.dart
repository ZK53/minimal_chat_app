import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void _logout() async {
    final AuthService auth = AuthService();
    auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("H O M E"),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("S E T T I N G S"),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, bottom: 10),
            child: Center(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("L O G O U T"),
                onTap: _logout,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
