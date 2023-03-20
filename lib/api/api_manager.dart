import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:route_ecommerce_c7_online/api/model/request/LoginRequest.dart';
import 'package:route_ecommerce_c7_online/api/model/request/RegisterRequest.dart';
import 'package:route_ecommerce_c7_online/api/model/response/LoginResponse.dart';
import 'package:route_ecommerce_c7_online/api/model/response/RegisterResponse.dart';

class ApiManager {
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) async {
    var requestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        repassword: rePassword,
        phone: phone);
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.register);
    var response = await http.post(url, body: requestBody.toJson());
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  Future<LoginResponse> login(String email, String password) async {
    var requestBody = LoginRequest(
      email: email,
      password: password,
    );
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.login);
    var response = await http.post(url, body: requestBody.toJson());
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}

class ApiConstants {
  static const baseUrl = 'route-ecommerce.vercel.app';
  static const register = 'api/v1/auth/signup';
  static const login = 'api/v1/auth/signin';
}
