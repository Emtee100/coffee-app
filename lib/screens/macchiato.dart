import 'package:flutter/material.dart';

import '../models/coffee.dart';

class Macchiato extends StatefulWidget {
  Coffee product;
  Macchiato({super.key, required this.product});

  @override
  State<Macchiato> createState() => _AmeriacnoState();
}

class _AmeriacnoState extends State<Macchiato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.product.name)),
    );
  }
}