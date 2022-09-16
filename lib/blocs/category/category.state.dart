
import '../../models/category.model.dart';

abstract class CategoriesState{}

class CategoriesLoadingState extends CategoriesState{} /* au moment du chargement*/

class CategoriesLoadedState extends CategoriesState{
    final List<Category> categories;
    CategoriesLoadedState({ this.categories = const <Category>[]});
}

class CategoriesErrorState extends CategoriesState{
    final String message;
    CategoriesErrorState({required this.message});
}

class CategoriesInitialState extends CategoriesState{
    final List<Category> categories;
    CategoriesInitialState({ this.categories = const <Category>[]});
}


