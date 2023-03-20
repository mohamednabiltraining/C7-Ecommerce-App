import 'package:flutter/material.dart';
import 'package:route_ecommerce_c7_online/base/base_navigator.dart';
import 'package:route_ecommerce_c7_online/base/base_viewModel.dart';
import 'package:route_ecommerce_c7_online/ui/dialog_utils.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    DialogUtils.showMessage(context, message,
        posAction: posAction,
        posActionTitle: posActionTitle,
        negAction: negAction,
        negActionTitle: negActionTitle,
        isDismissible: isDismissible);
  }

  @override
  void showProgressDialog(String progressMessage) {
    DialogUtils.showProgressDialog(context, progressMessage);
  }

  @override
  void hideDialog() {
    DialogUtils.hideDialog(context);
  }
}
