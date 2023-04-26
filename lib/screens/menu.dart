import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffeeshop.dart';
import 'package:coffee_shop/screens/expresso.dart';
import 'package:coffee_shop/screens/flatWhite.dart';
import 'package:coffee_shop/screens/icedCoffee.dart';
import 'package:coffee_shop/screens/latte.dart';
import 'package:coffee_shop/screens/macchiato.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'americano.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Menu",
            style: GoogleFonts.mulish(fontWeight: FontWeight.w600)),
      ),
      body: Consumer<CoffeeShop>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ProductsGrid(productsData: value),
        ),
      ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  CoffeeShop productsData;
  ProductsGrid({super.key, required this.productsData});

  @override
  Widget build(BuildContext context) {
    List<Coffee> products = productsData.coffee;
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 17.0,
            crossAxisSpacing: 17.0,
            childAspectRatio: 2 / 3),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Americano(
                                product: products[index],
                                store: productsData,
                              )));
                  break;
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Macchiato(
                                product: products[index],
                                store: productsData,
                              )));
                  break;
                case 2:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FlatWhite(
                                product: products[index],
                                store: productsData,
                              )));
                  break;
                case 3:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Latte(
                                product: products[index],
                                store: productsData,
                              )));
                  break;
                case 4:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IcedCoffee(
                                product: products[index],
                                store: productsData,
                              )));
                  break;
                case 5:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Expresso(
                              product: products[index], store: productsData)));
                  break;
              }
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    products[index].imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(13)),
                ),
                Positioned(
                  right: 10.0,
                  top: 10.0,
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      '\$ ${products[index].price}',
                      style: GoogleFonts.mulish(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 10.0,
                  child: Container(
                    child: Text(
                      products[index].name,
                      style: GoogleFonts.mulish(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
