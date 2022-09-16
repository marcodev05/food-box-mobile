import 'dart:convert';

import 'package:food_box/models/category.model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<Category>> fetchAllCategories() async {
    String baseUrl = "http://192.168.43.187:8082";
    try {
      http.Response response = await http.get(Uri.parse('$baseUrl/public/v1/categories'));
      if (response.statusCode == 200) {
        List<dynamic> categoryMap = json.decode(response.body);
        List<Category> categories = <Category>[];
        for (Map<String, dynamic> element in categoryMap) {
          categories.add(Category.fromJson(element));
        }
        return categories;
      } else {
        return throw (" Error: ${response.statusCode}");
      }
    } catch (ex) {
      return throw (" Error: $ex");
    }
  }
}
