import 'package:flutter/material.dart';

import 'coffee.dart';



class CoffeeShop with ChangeNotifier{
  // list of coffee on sale
  final List<Coffee> _shop =[
    Coffee(name: "Americano", 
    price: 2.05, 
    imageURL: "images/coffee 1.jpg"),

    Coffee(name: "Macchiato", 
    price: 2.15, 
    imageURL: "images/coffee 2.jpg"),

    Coffee(name: "Flat White", 
    price: 2.05, 
    imageURL: "images/coffee 3.jpg"),

    Coffee(name: "Latte", 
    price: 2.15, 
    imageURL: "images/coffee 4.jpg"),

    Coffee(name: "Iced Coffee", 
    price: 1.95, 
    imageURL: "images/coffee 5.jpg"),

    Coffee(name: "Expresso", 
    price: 2.25, 
    imageURL: "images/coffee 6.jpg"),

  ];
  // user selected coffee

  List <Coffee> _selectedCoffee = [];

  // get coffee list
   List <Coffee> get coffee => _shop;

  // get user selected list of coffee

  List <Coffee> get checkout => _selectedCoffee;

  // method of adding coffee to user selected list

  void addCoffee(Coffee coffee){
    _selectedCoffee.add(coffee);
    notifyListeners();
  }

  // method of removing coffee from user selected list
  void removeCoffee(Coffee coffee){
    _selectedCoffee.remove(coffee);
    notifyListeners();
  }
}