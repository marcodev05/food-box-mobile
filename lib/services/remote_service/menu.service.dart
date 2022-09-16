import 'dart:convert';

import '../../models/menu.model.dart';
import 'package:http/http.dart' as http;

class MenuService {

  Future<List<Menu>> fetchAllMenus() async {
    String url = "http://192.168.43.187:8082/public/v1/menus/available";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> menuMap = json.decode(response.body);
        List<Menu> menus = <Menu>[];
        for (Map<String, dynamic> element in menuMap) {
          menus.add(Menu.fromJson(element));
        }
        return menus;
      } else {
        return throw (" Error: ${response.statusCode}");
      }

    } catch (ex) {
      return throw (ex.toString());
    }
  }
}
