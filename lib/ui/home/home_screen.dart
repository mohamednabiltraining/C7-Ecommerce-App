import 'package:flutter/material.dart';
import 'package:route_ecommerce_c7_online/base/base_state.dart';
import 'package:route_ecommerce_c7_online/ui/home/HomeViewModel.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
