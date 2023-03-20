import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_ecommerce_c7_online/provider/app_config_provider.dart';
import 'package:route_ecommerce_c7_online/ui/home/home_screen.dart';
import 'package:route_ecommerce_c7_online/ui/login/login_screen.dart';
import 'package:route_ecommerce_c7_online/ui/register/register_screen.dart';
import 'package:route_ecommerce_c7_online/ui/splash/splash_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => AppConfigProvider(), child: MyApplication()));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: const Color(0xFF004182), elevation: 0),
          primaryColor: const Color(0xFF004182),
          scaffoldBackgroundColor: const Color(0xFF004182)),
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
