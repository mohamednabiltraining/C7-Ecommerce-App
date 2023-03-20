import 'package:route_ecommerce_c7_online/api/api_manager.dart';
import 'package:route_ecommerce_c7_online/base/base_viewModel.dart';
import 'package:route_ecommerce_c7_online/provider/app_config_provider.dart';
import 'package:route_ecommerce_c7_online/repository/auth/auth_repo_contract.dart';
import 'package:route_ecommerce_c7_online/ui/register/register_navigator.dart';

class RegisterViewModel extends BaseViewModel<RegisterNavigator> {
  AppConfigProvider configProvider;

  AuthRepository authRepository;

  // late AuthRemoteDataSource remoteDataSource;
  //late ApiManager apiManager;
  // dependancy application on dip
  RegisterViewModel(this.authRepository, this.configProvider);

  // {
  //   apiManager = ApiManager();
  //   remoteDataSource = AuthRemoteDataSourceImpl(apiManager);
  //   authRepository = AuthRepositoryImpl(remoteDataSource);
  // }
  void register(String name, String email, String password,
      String passwordConfirmation, String phone) async {
    navigator?.showProgressDialog('Loading...');
    try {
      var token = await authRepository.register(
          name, email, password, passwordConfirmation, phone);
      navigator?.hideDialog();

      if (token == null) {
        navigator?.showMessage('unable to register', posActionTitle: 'Ok');
        return;
      }
      // navigate to home
      navigator?.showMessage('successful Registration', posActionTitle: 'Ok',
          posAction: () {
        // navigate to home
        configProvider?.updateToken(token);
        navigator?.gotoHome();
      }, isDismissible: false);
    } catch (e) {
      navigator?.hideDialog();
      navigator?.showMessage('Error , ' + e.toString());
    }
  }
}
