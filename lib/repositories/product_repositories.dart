import 'package:eshopping/api/product_api.dart';

import '../response/get_product_response.dart';

class ProductRepository {
  Future<ProductResponse?> getProducts() {
    return ProductAPI().getProducts();
  }
}
