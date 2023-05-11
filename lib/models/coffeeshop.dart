import 'package:flutter/material.dart';

import 'coffee.dart';



class CoffeeShop with ChangeNotifier{
  // list of coffee on sale
  final List<Coffee> _shop =[
    Coffee(name: "Americano", 
    price: 2.05, 
    imageURL: "images/coffee 1.jpg",
    tag: "coffee-1"
    ),

    Coffee(name: "Macchiato", 
    price: 2.15, 
    imageURL: "images/coffee 2.jpg",
    tag: "coffee-2"),

    Coffee(name: "Flat White", 
    price: 2.05, 
    imageURL: "images/coffee 3.jpg",
    tag: "coffee-3"),

    Coffee(name: "Latte", 
    price: 2.15, 
    imageURL: "images/coffee 4.jpg",
    tag: "coffee-4"),

    Coffee(name: "Iced Coffee", 
    price: 1.95, 
    imageURL: "images/coffee 5.jpg",
    tag: "coffee-5"),

    Coffee(name: "Expresso", 
    price: 2.25, 
    imageURL: "images/coffee 6.jpg",
    tag: "coffee-6"),

  ];
  // user selected coffee

  final List <Coffee> _selectedCoffee = [];

  // get coffee list
   List <Coffee> get coffee => _shop;

  // get user selected list of coffee

  List <Coffee> get checkout => _selectedCoffee;

  // method of adding coffee to user selected list

  void addCoffee(Coffee coffee, double totalPrice, String productSize){
    coffee.totalPrice = totalPrice;
    coffee.size = productSize;
    _selectedCoffee.add(coffee);
    notifyListeners();
  }

  // method of removing coffee from user selected list
  void removeCoffee(Coffee coffee){
    _selectedCoffee.remove(coffee);
    notifyListeners();
  }

  void buyItems (){
      checkout.clear();
      notifyListeners();
  }
}