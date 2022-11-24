import 'package:flutter/material.dart';

import 'package:food_box/ui/widgets/search.bar.widget.dart';


import '../../../blocs/menu/menu.bloc.dart';
import '../../../blocs/menu/menu.state.dart';
import '../../../models/menu.model.dart';
import '../../widgets/bigtext.widget.dart';
import '../../widgets/category.carousel.widget.dart';
import '../../widgets/menu.item.card.widget.dart';
import '../../widgets/smalltext.widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_box/ui/pages/home/widgets/header.app.widget.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: SingleChildScrollView(
        child: Container(
          height: 600,
          child: Column(
            children: [
              MainHeaderApp(),
              SearchBar(),
              const CategoryCarousel(),
              const SizedBox(height: 8),

              /*** more popular menu **/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: 'Most popular', size: 17),
                  const Text("View all",
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.w600)),
                ],
              ),
              BlocBuilder<MenusBloc, MenusState>(
                builder: (context, state) {
                  if (state is MenuLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is MenuLoadedState) {
                    return Container(
                      height: 220,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.menus.length,
                          itemBuilder: (BuildContext context, int index) {
                            Menu menu = state.menus[index];
                            print("menu object");
                            return MenuCard(menu: menu);
                          }),
                    );
                  }
                  if (state is MenuErrorState) {
                    return SmallText(
                      text: 'Erreur de connexion error state',
                    );
                  } else {
                    return SmallText(
                      text: 'Erreur de connexion else',
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}