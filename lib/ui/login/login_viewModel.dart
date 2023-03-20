import 'package:flutter/material.dart';
import 'package:route_ecommerce_c7_online/api/api_manager.dart';
import 'package:route_ecommerce_c7_online/base/base_viewModel.dart';
import 'package:route_ecommerce_c7_online/provider/app_config_provider.dart';
import 'package:route_ecommerce_c7_online/repository/auth/auth_repo_contract.dart';
import 'package:route_ecommerce_c7_online/repository/auth/impl/auth_remote_datasource_impl.dart';
import 'package:route_ecommerce_c7_online/repository/auth/impl/auth_repo_impl.dart';
import 'package:route_ecommerce_c7_online/ui/login/login_navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  AppConfigProvider configProvider;

  AuthRepository authRepository;

  LoginViewModel(this.authRepository, this.configProvider);

  void login(String email, String password) async {
    navigator?.showProgressDialog('Loading...');
    try {
      var token = await authRepository.login(email, password);
      navigator?.hideDialog();

      if (token == null) {
        navigator?.showMessage(
          "unable to login, wrong user name or password",
          posActionTitle: 'Ok',
        );
        return;
      }
      navigator?.showMessage('successful Login', posActionTitle: 'Ok',
          posAction: () {
        configProvider.updateToken(token);
        // navigate to home screen
        navigator?.gotoHome();
      });
    } catch (e) {
      navigator?.hideDialog();
      navigator?.showMessage('Error , ' + e.toString());
    }
  }
}
