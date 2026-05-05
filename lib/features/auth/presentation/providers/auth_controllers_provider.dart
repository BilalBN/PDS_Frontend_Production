import 'package:flutter/material.dart';

class AuthControllersProvider with ChangeNotifier {
  final identifierController = TextEditingController();
  String get identifier => identifierController.value.text;

  final passwordController = TextEditingController();
  String get password => passwordController.value.text;

  @override
  void dispose() {
    identifierController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
