import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Beverages extends StatelessWidget {
  const Beverages({super.key});

  @override
  Widget build(BuildContext context) {
    List beverages = [
    {"icon": Icon(Icons.coffee_maker_rounded), "text": "Signatured"},
    {"icon": FaIcon(FontAwesomeIcons.mugSaucer), "text": "Iced Coffee"},
    {"icon": FaIcon(FontAwesomeIcons.mugHot), "text": "Hot coffee"},
    {"icon": Icon(Icons.coffee), "text": "Chocolate"}
  ];
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              height: 130,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: beverages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 2
                      ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 242, 247),
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Row(children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: beverages[index]["icon"] 
                        ),

                        Text(beverages[index]["text"])
                      ]),
                    );
                  }),
    );
  }
}