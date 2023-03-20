import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String? token;

  void updateToken(String? token) {
    this.token = token;
  }
}
