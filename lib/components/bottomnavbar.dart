// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key,});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return  GNav(
      activeColor: Colors.white,
      backgroundColor: Colors.brown,
      
       tabs: [
        GButton(
          icon: Icons.home,
          text: "Home",
        ),
        GButton(icon: Icons.restaurant_menu_rounded,
        text: "Menu",
        ),
        GButton(
          icon: Icons.card_giftcard,
          text: "Likes",
        ),
        GButton(icon: Icons.account_circle,
        text: "Profile",
        ),
      ]);
  }
}
