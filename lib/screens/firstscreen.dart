import 'package:coffee_shop/models/coffeeshop.dart';
import 'package:coffee_shop/screens/cart.dart';
import 'package:coffee_shop/screens/homepage.dart';
import 'package:coffee_shop/screens/menu.dart';
import 'package:coffee_shop/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    List screens = const [MyHomePage(), Menu(), Cart(), Profile()];
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      child: Scaffold(
          body: screens[selectedTab],
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                indicatorColor: Colors.brown.shade300,
                labelTextStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 15))),
            child: NavigationBar(
                selectedIndex: selectedTab,
                onDestinationSelected: (index) => setState(() {
                      selectedTab = index;
                      // onDestinationSelected takes the index of the option selected and sets it as the parameter of the anonymous function
                    }),
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: "home"),
                  NavigationDestination(icon: Icon(Icons.coffee), label: "menu"),
                  NavigationDestination(
                      icon: Icon(Icons.shopping_bag_outlined),
                      selectedIcon: Icon(Icons.shopping_bag_rounded),
                       label: "cart"),
                  NavigationDestination(
                      icon: Icon(Icons.account_circle_outlined), 
                      selectedIcon: Icon(Icons.account_circle_rounded),
                      label: "profile")
                ]),
          )),
    );
  }
}
