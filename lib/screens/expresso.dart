import 'package:flutter/material.dart';

import '../models/coffee.dart';

class Expresso extends StatefulWidget {
  Coffee product;
  Expresso({super.key, required this.product});

  @override
  State<Expresso> createState() => _AmeriacnoState();
}

class _AmeriacnoState extends State<Expresso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.product.name)),
    );
  }
}