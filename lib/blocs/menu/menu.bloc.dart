import 'package:bloc/bloc.dart';
import 'package:food_box/blocs/menu/menu.event.dart';
import 'package:food_box/blocs/menu/menu.state.dart';
import 'package:food_box/services/remote_service/menu.service.dart';

import '../../models/menu.model.dart';

class MenusBloc extends Bloc<MenusEvent, MenusState> {
  MenuService menuService = MenuService();
  MenusBloc() : super(MenuLoadingState()) {
    on((LoadMenusEvent event, Emitter<MenusState> emit) async {
      try {
        emit(MenuLoadingState());
        List<Menu> menus = await menuService.fetchAllMenus();
        emit(MenuLoadedState(menus: menus));
        print("menu loaded state");
      } catch (ex) {
        emit(MenuErrorState(message: "Erreur de connexion au serveur"));
      }
    });
  }
}
