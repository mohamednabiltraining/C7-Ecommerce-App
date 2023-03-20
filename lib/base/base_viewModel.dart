import 'package:flutter/material.dart';
import 'package:route_ecommerce_c7_online/base/base_navigator.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier {
  N? navigator;
}
