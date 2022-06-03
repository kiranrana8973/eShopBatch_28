import 'package:dio/dio.dart';
import 'package:eshopping/utils/api_url.dart';

class HttpServices {
  static final HttpServices _instance = HttpServices._internal();
  factory HttpServices() => _instance;
  HttpServices._internal();

  static Dio? _dio;

  Dio getDioInstance() {
    if (_dio == null) {
      return _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 5000,
        ),
      );
    } else {
      return _dio!;
    }
  }

  // initializeInterceptor() {
  //   _dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) {
  //         debugPrint("Request: ${options.path} ${options.method}");
  //       },
  //       onError: (DioError error, handler) {
  //         debugPrint("Error aayo: ${error.response?.statusCode}");
  //       },
  //       onResponse: (Response response, handler) {
  //         debugPrint("Response: ${response.statusCode}");
  //       },
  //     ),
  //   );
  // }
}
