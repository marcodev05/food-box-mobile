import 'package:flutter/material.dart';
import 'package:food_box/ui/widgets/smalltext.widget.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: const EdgeInsets.only(top: 2, bottom: 2, left: 20, right: 5),
        height: 45,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 5), blurRadius: 20, color: Colors.black38)
            ]),
        child: const TextField(
          decoration: InputDecoration(
              hintText: "search your food",
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black54,
              )),
        ));
  }
}
