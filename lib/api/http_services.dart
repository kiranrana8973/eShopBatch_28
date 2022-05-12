import 'package:dio/dio.dart';
import 'package:eshopping/constants/api_url.dart';

class HttpServices {
  static final HttpServices _instance = HttpServices._internal();
  factory HttpServices() => _instance;
  HttpServices._internal();

  static Dio? _dio;
  Dio getDioInstance() => _dio ??= Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 5000,
        ),
      );

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
