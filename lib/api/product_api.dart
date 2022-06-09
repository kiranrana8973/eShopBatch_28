import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eshopping/api/http_services.dart';
import 'package:eshopping/response/get_product_response.dart';
import 'package:mime/mime.dart';
import '../model/product.dart';
import '../utils/api_url.dart';
import 'package:http_parser/http_parser.dart';

class ProductAPI {
  Future<bool> addProduct(File? file, Product product) async {
    try {
      var url = baseUrl + productUrl;
      var dio = HttpServices().getDioInstance();
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);

        image = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split("/").last,
          contentType: MediaType("image", mimeType!.split("/")[1]),
        ); // image/jpeg -> jpeg
      }

      var formData = FormData.fromMap({
        "name": product.name,
        "description": product.description,
        "image": image,
        "price": product.price,
        "category": product.category,
        "countInStock": product.countInStock,
        "rating": product.rating,
        "numReviews": product.numReviews,
        "isFeatured": product.isFeatured,
      });
      var response = await dio.post(url, data: formData);

      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }

    return false;
  }

  Future<ProductResponse?> getProducts() async {
    Future.delayed(const Duration(seconds: 2), () {});
    ProductResponse? productResponse;
    try {
      var url = baseUrl + productUrl;
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


   // var formData = FormData.fromMap(
      //   {
      //     "name": "test",
      //     "description": "test",
      //     "image": image,
      //     "price": "234",
      //     "category": "6281fdb044d29546f08846d4",
      //     "countInStock": "2",
      //     "rating": "3",
      //     "numReviews": "3",
      //     "isFeatured": "false",
      //   },
      // );