import 'package:eshopping/api/product_api.dart';

class ProductRepository {
  getProducts() async {
    return await ProductAPI().getProducts();
  }
}
