import 'package:flutter/material.dart';
import 'package:minimal_chat_app/pages/login_page.dart';
import 'package:minimal_chat_app/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool _isLogin = true;

  void _togglePages() {
    setState(() => _isLogin = !_isLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLogin) {
      return LoginPage(onPressed: _togglePages);
    } else {
      return RegisterPage(onPressed: _togglePages);
    }
  }
}
