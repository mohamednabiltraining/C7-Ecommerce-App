import 'package:route_ecommerce_c7_online/api/model/response/LoginResponse.dart';
import 'package:route_ecommerce_c7_online/api/model/response/RegisterResponse.dart';

abstract class AuthRepository {
  /// this function returns token in case of successful
  /// and returns null in case of failed login
  Future<String?> login(String email, String password);

  Future<String?> register(String name, String email, String password,
      String passwordConfirmation, String phone);
}

abstract class AuthRemoteDataSource {
  // to call the api
  Future<LoginResponse> login(String email, String password);

  Future<RegisterResponse> register(String name, String email, String password,
      String passwordConfirmation, String phone);
}
