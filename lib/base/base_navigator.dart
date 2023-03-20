import 'dart:ui';

abstract class BaseNavigator {
  void hideDialog();

  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true});

  void showProgressDialog(String progressMessage);
}
