import 'package:route_ecommerce_c7_online/repository/auth/auth_repo_contract.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<String?> login(String email, String password) async {
    var response = await remoteDataSource.login(email, password);
    return response.token;
  }

  @override
  Future<String?> register(String name, String email, String password,
      String passwordConfirmation, String phone) async {
    var response = await remoteDataSource.register(
        name, email, password, passwordConfirmation, phone);
    return response.token;
  }
}
