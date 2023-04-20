import 'package:flutter/material.dart';

import '../models/coffee.dart';

class IcedCoffee extends StatefulWidget {
  Coffee product;
  IcedCoffee({super.key, required this.product});

  @override
  State<IcedCoffee> createState() => _AmeriacnoState();
}

class _AmeriacnoState extends State<IcedCoffee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.product.name)),
    );
  }
}