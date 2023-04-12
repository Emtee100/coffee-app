import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Good Morning",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w300, fontSize: 14, color: Colors.grey.shade500)),
                      Text("Jimmy Sullivan",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w800, fontSize: 18))
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all()),
                      child: IconButton(
                          onPressed: () {
                            print("Cart");
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.bagShopping,
                            color: Colors.black,
                          )))
                ],
              ),
    );
  }
}