import 'dart:convert';

import '../../models/menu.model.dart';
import 'package:http/http.dart' as http;

class MenuService {

  Future<List<Menu>> fetchAllMenus() async {
    String url = "http://192.168.43.187:8082/public/v1/menus/available";
    http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        List menuMap = json.decode(response.body);
          //return menuMap.map((e) => Menu.fromJson(e)).toList();
        List<Menu> menus = <Menu>[];
        for (Map<String, dynamic> element in menuMap) {
          menus.add(Menu.fromJson(element));
        }
        return menus;
      } else {
        return throw (" Error: ${response.statusCode}");
      }

    } catch (ex) {
      print(ex);
      return throw (" Error ${ex.toString()}");
    } finally{
      print(response.statusCode);
    }
  }
}
