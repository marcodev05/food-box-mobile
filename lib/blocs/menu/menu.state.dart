import '../../models/menu.model.dart';

abstract class MenusState{}

class MenuLoadingState extends MenusState{}

class MenuLoadedState extends MenusState{
  final List<Menu> menus;
  MenuLoadedState({required this.menus});
}

class MenuErrorState extends MenusState{
  final String message;
  MenuErrorState({required this.message});
}