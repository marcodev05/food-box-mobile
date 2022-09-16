import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_box/ui/pages/home/widgets/header.app.widget.dart';
import 'package:food_box/ui/widgets/main.drawer.widget.dart';
import 'package:food_box/ui/widgets/search.bar.widget.dart';

import '../../../blocs/category/category.bloc.dart';
import '../../../blocs/category/category.state.dart';
import '../../../blocs/menu/menu.bloc.dart';
import '../../../blocs/menu/menu.state.dart';
import '../../../models/menu.model.dart';
import '../../widgets/bigtext.widget.dart';
import '../../widgets/category.carousel.widget.dart';
import '../../widgets/menu.item.card.widget.dart';
import '../../widgets/smalltext.widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application.
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: const [
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text("Antananrivo")),
            Padding(
                padding: EdgeInsets.only(right: 20.0), child: Icon(Icons.place))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: ''),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
          child: Column(
            children: [
              MainHeaderApp(),
              SearchBar(),
              CategoryCarousel(),
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
              Expanded(
                child: BlocBuilder<MenusBloc, MenusState>(
                  builder: (context, state) {
                    if (state is MenuLoadingState) {
                      return CircularProgressIndicator();
                    }
                    if (state is MenuLoadedState) {
                      return Container(

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
                        text: 'Erreur de connexion',
                      );
                    } else {
                      return SmallText(
                        text: 'Erreur de connexion',
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
    throw UnimplementedError();
  }
}
