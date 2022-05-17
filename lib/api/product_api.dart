import 'package:dio/dio.dart';
import 'package:eshopping/api/http_services.dart';
import 'package:eshopping/response/get_product_response.dart';
import '../utils/api_url.dart';

class ProductAPI {
  Future<ProductResponse?> getProducts() async {
    Future.delayed(const Duration(seconds: 2), () {});
    ProductResponse? productResponse;
    try {
      var url = baseUrl + getProductsUrl;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.getUri(Uri.parse(url));
      if (response.statusCode == 201) {
        productResponse = ProductResponse.fromJson(response.data);
      } else {
        productResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return productResponse;
  }
}
