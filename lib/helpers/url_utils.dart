import 'package:food_box/helpers/app_constant.dart';
import 'package:food_box/models/menu.model.dart';

class UrlUtilsApp {

  static String checkUrlPicture(Menu menu){
    String picture;
    if(menu.picture != null){
      Uri url = Uri.parse(menu.picture!);
      picture = AppConstant.baseUrl + url.path;
    }else {
      picture = "${AppConstant.baseUrl}/downloadFile/pizza-pizza-remplie-tomates-salami-olives_140725-1200.jpg";
    }
    return picture;
  }

}