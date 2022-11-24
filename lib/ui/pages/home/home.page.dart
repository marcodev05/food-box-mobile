import 'package:flutter/material.dart';
import 'package:food_box/ui/pages/cart/my_cart.page.dart';
import 'package:food_box/ui/widgets/main.drawer.widget.dart';
import 'package:food_box/ui/pages/home/main_food_page.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  // This widget is the home page of your application.
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _selectedIndex=0;

  List pages = [
    const MainFoodPage(),
    const MyCart(),
    const MyCart()
  ];

  void onTapNav(int index){
    if(index == 0){
      setState((){
        Navigator.of(context).pushNamed('/');
        _selectedIndex=index;
      });
    }
    if(index == 1){
      setState((){
        Navigator.of(context).pushNamed('/myCart');
        _selectedIndex=index;
      });
    }
    if(index == 2){
      setState((){
        Navigator.of(context).pushNamed('/login');
        _selectedIndex=index;
      });
    }
  }

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
                padding: EdgeInsets.only(top: 20.0), child: Text("Antananrivo")),
            Padding(
                padding: EdgeInsets.only(right: 20.0), child: Icon(Icons.place))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
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
        body: const MainFoodPage(),

      );
    throw UnimplementedError();
  }
}

