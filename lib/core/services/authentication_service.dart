import 'dart:io';

import 'package:dio/dio.dart';
import 'package:urgut_please/config/di/injection.dart';
import 'package:urgut_please/core/errors/api_exception.dart';
import 'package:urgut_please/core/services/token_service.dart';
import 'package:urgut_please/core/utils/constants.dart';
import 'package:urgut_please/shared/models/user/user_model.dart';
import 'package:urgut_please/shared/services/api_service.dart';

abstract class AuthenticationService {
  Future<UserModel> register(UserCreateDto user);
  Future<void> sendVerification(String login);
  Future<void> verify(String login, String code);
  Future<String> login(String login, String password);
  Future<void> resetPassword(String login, String newPassword, String verificationCode);
  Future<void> logout();
}

class AuthenticationServiceImpl implements AuthenticationService {
  @override
  Future<UserModel> register(UserCreateDto user) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Create request
      final response = await getIt<ApiService>().postFormDataRequest(
        ApiEndpoints.register,
        formData: FormData.fromMap(user.toJson()),
      );

      // Return user
      return UserModel.fromJson(response.data["user"]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendVerification(String login) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Send verification request
      await getIt<ApiService>().postFormDataRequest(
        ApiEndpoints.sendVerification,
        formData: FormData.fromMap({"login": login}),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> verify(String login, String code) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Verify request
      await getIt<ApiService>().postFormDataRequest(
        ApiEndpoints.verify,
        formData: FormData.fromMap({"login": login, "code": code}),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> login(String login, String password) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Login request
      final response = await getIt<ApiService>().postFormDataRequest(
        ApiEndpoints.login,
        formData: FormData.fromMap({"login": login, "password": password}),
      );

      final token = response.data["access_token"];
      await getIt<TokenService>().saveUser(token, login, password);

      // Return access token
      return token;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception("Login yoki parol noto'g'ri");
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String login, String newPassword, String verificationCode) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Reset password request
      await getIt<ApiService>().postRequest(
        ApiEndpoints.resetPassword,
        data: {"login": login, "new_password": newPassword, "verification_code": verificationCode},
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      getIt<TokenService>().deleteToken();
    } catch (e) {
      rethrow;
    }
  }
}
