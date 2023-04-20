import 'package:flutter/material.dart';

import '../models/coffee.dart';

class Americano extends StatefulWidget {
  Coffee product;
  Americano({super.key, required this.product});

  @override
  State<Americano> createState() => _AmeriacnoState();
}

class _AmeriacnoState extends State<Americano> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.product.name)),
    );
  }
}