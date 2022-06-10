import 'package:eshopping/api/category_api.dart';

import '../model/dropdown_category.dart';

class CategoryRepository {
  Future<List<DropdownCategory?>> loadCategory() {
    return CategoryAPI().loadCategory();
  }
}

