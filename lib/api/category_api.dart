import 'package:dio/dio.dart';
import 'package:eshopping/api/http_services.dart';
import 'package:eshopping/model/dropdown_category.dart';
import 'package:eshopping/response/category_response.dart';
import 'package:eshopping/utils/api_url.dart';
import 'package:flutter/cupertino.dart';

class CategoryAPI {
  Future<Map<String, String>?> getCategory() async {
    Response response;
    var url = baseUrl + categoryUrl;
    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(url);
      if (response.statusCode == 201) {
        CategoryResponse categoryResponse =
            CategoryResponse.fromJson(response.data);
        Map<String, String> categoryMap = <String, String>{};

        for (var data in categoryResponse.data!) {
          categoryMap[data.id.toString()] = data.name!;
        }

        return categoryMap;
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }
    return null;
  }

  Future<List<DropdownCategory?>> loadCategory() async {
    List<DropdownCategory?> dropdownCategoryList = [];
    Response response;
    var url = baseUrl + categoryUrl;
    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(url);
      if (response.statusCode == 201) {
        CategoryResponse categoryResponse =
            CategoryResponse.fromJson(response.data);
        for (var data in categoryResponse.data!) {
          dropdownCategoryList.add(
            DropdownCategory(
              id: data.id,
              name: data.name,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }

    return dropdownCategoryList;
  }
}
