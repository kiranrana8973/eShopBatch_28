import 'package:eshopping/api/category_api.dart';

class CategoryRepository {
  Future<Map<String, String>?> getCategory() async {
    return CategoryAPI().getCategory();
  }
}
