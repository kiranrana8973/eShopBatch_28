import 'package:dio/dio.dart';
import 'package:eshopping/api/http_services.dart';
import 'package:eshopping/constants/api_url.dart';
import 'package:eshopping/model/user.dart';
import 'package:flutter/cupertino.dart';

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
}
