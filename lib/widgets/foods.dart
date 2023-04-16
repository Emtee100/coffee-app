import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Foods extends StatelessWidget {
  const Foods({super.key});

  @override
  Widget build(BuildContext context) {
      List foods = [
      {"icon": FaIcon(FontAwesomeIcons.burger), "text": "Signatured"},
      {"icon": Icon(Icons.cake), "text": "Bakery"},
      {"icon": Icon(Icons.rice_bowl_rounded), "text": "Salad"},
      {"icon": FaIcon(FontAwesomeIcons.tumblr), "text": "Yoghurt"}
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.0),
      height: 130,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: foods.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 2),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 242, 247),
                  borderRadius: BorderRadius.circular(40)),
              child: Row(children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: foods[index]["icon"]),
                Text(foods[index]["text"])
              ]),
            );
          }),
    );
  }
}
