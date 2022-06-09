import 'package:eshopping/api/category_api.dart';

import '../model/dropdown_category.dart';

class CategoryRepository {
  Future<Map<String, String>?> getCategory() async {
    return CategoryAPI().getCategory();
  }

  Future<List<DropdownCategory?>> loadCategory() async {
    return CategoryAPI().loadCategory();
  }
}
