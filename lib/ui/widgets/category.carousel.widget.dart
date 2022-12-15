import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_box/blocs/category/category.bloc.dart';
import 'package:food_box/blocs/category/category.state.dart';
import 'package:food_box/ui/widgets/smalltext.widget.dart';

import '../../helpers/app_constant.dart';
import '../../models/category.model.dart';
import 'bigtext.widget.dart';
import 'category.item.widget.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          BigText(text: 'Categories', size: 17),
        ]),

        /** carousel **/

        BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is CategoriesErrorState) {
              return SmallText(text: state.message, color: Colors.redAccent,);
            }
            if (state is CategoriesLoadedState) {
              return Container(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      Category category = state.categories[index];
                      return ItemCategory(category: category);
                    },
                  ));
            }
            else {
              return SmallText(text: "Something went wrong", color: Colors.redAccent,);;
            }
          },
        )
      ],
    );
  }
}
