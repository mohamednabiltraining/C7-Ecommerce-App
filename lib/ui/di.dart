import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:route_ecommerce_c7_online/api/api_manager.dart';
import 'package:route_ecommerce_c7_online/provider/app_config_provider.dart';
import 'package:route_ecommerce_c7_online/repository/auth/auth_repo_contract.dart';
import 'package:route_ecommerce_c7_online/repository/auth/impl/auth_remote_datasource_impl.dart';
import 'package:route_ecommerce_c7_online/repository/auth/impl/auth_repo_impl.dart';

AuthRepository getAuthRepository(AuthRemoteDataSource remoteDataSource) {
  return AuthRepositoryImpl(remoteDataSource);
}

AuthRemoteDataSource getAuthRemoteDataSource(ApiManager apiManager) {
  return AuthRemoteDataSourceImpl(apiManager);
}

ApiManager getApiManager() {
  return ApiManager();
}

AuthRepository injectAuthRepository() {
  return getAuthRepository(getAuthRemoteDataSource(getApiManager()));
}

AppConfigProvider getAppConfigProvider(BuildContext context) {
  return Provider.of<AppConfigProvider>(context, listen: false);
}
