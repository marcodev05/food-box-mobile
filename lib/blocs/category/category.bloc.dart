import 'package:bloc/bloc.dart';
import 'package:food_box/blocs/category/category.event.dart';
import 'package:food_box/blocs/category/category.state.dart';

import '../../models/category.model.dart';
import '../../services/remote_service/category.service.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoryService categoryService = CategoryService();

  CategoriesBloc() : super(CategoriesLoadingState()) {
    on((LoadCategoriesEvent event, Emitter<CategoriesState> emit) async {
      try {
        emit(CategoriesLoadingState());
        List<Category> categories = await categoryService.fetchAllCategories();
        emit(CategoriesLoadedState(categories: categories));
        print("category loaded state");
      } catch (ex) {
        emit(CategoriesErrorState(message: "Erreur de connexion au serveur"));
      }
    });
  }
}
