import 'dart:io';

import 'package:eshopping/api/product_api.dart';

import '../response/get_product_response.dart';

class ProductRepository {
  Future<ProductResponse?> getProducts() async {
    return ProductAPI().getProducts();
  }

  Future<bool> addProduct(File file) async {
    return ProductAPI().addProduct(file);
  }
}
