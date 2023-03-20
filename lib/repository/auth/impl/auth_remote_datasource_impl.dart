import 'package:route_ecommerce_c7_online/api/api_manager.dart';
import 'package:route_ecommerce_c7_online/api/model/response/LoginResponse.dart';
import 'package:route_ecommerce_c7_online/api/model/response/RegisterResponse.dart';
import 'package:route_ecommerce_c7_online/repository/auth/auth_repo_contract.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<LoginResponse> login(String email, String password) async {
    var response = await apiManager.login(email, password);
    return response;
  }

  @override
  Future<RegisterResponse> register(String name, String email, String password,
      String passwordConfirmation, String phone) async {
    var response = await apiManager.register(
        name, email, password, passwordConfirmation, phone);
    return response;
  }
}
