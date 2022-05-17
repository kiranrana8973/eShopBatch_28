import 'package:eshopping/api/product_api.dart';

class ProductRepository {
  getProducts() {
    return ProductAPI().getProducts();
  }
}
