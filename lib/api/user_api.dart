import 'package:dio/dio.dart';
import 'package:eshopping/api/http_services.dart';
import 'package:eshopping/response/login_response.dart';
import 'package:eshopping/utils/api_url.dart';
import 'package:eshopping/model/user.dart';
import 'package:flutter/material.dart';

class UserAPI {
  Future<bool> registerUser(User user) async {
    bool isLogin = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<bool> login(String username, String password) async {
    try {
      var dio = HttpServices().getDioInstance();

      var response = await dio.post(
        loginUrl,
        data: {
          "username": username,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
