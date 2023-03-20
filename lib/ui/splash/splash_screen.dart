import 'dart:async';

import 'package:flutter/material.dart';
import 'package:route_ecommerce_c7_online/ui/register/register_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_screen.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
