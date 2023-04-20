import 'package:flutter/material.dart';

import '../models/coffee.dart';

class FlatWhite extends StatefulWidget {
  Coffee product;
  FlatWhite({super.key, required this.product});

  @override
  State<FlatWhite> createState() => _AmeriacnoState();
}

class _AmeriacnoState extends State<FlatWhite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.product.name)),
    );
  }
}