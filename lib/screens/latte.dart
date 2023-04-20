import 'package:flutter/material.dart';

import '../models/coffee.dart';

class Latte extends StatefulWidget {
  Coffee product;
  Latte({super.key, required this.product});

  @override
  State<Latte> createState() => _AmeriacnoState();
}

class _AmeriacnoState extends State<Latte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.product.name)),
    );
  }
}