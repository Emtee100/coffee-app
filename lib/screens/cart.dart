import 'package:coffee_shop/models/coffeeshop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Cart",
            style: GoogleFonts.mulish(fontWeight: FontWeight.w600),
          ),
        ),
        body: Consumer<CoffeeShop>(
          builder: (context, value, child) => Stack(
            children: [
              ListView.builder(
                itemCount: value.checkout.length,
                itemBuilder: (context, index) {
                  return value.checkout.isEmpty
                      ? Center(
                          child: Text(
                          "No items in cart, go to our menu and add items",
                          style: GoogleFonts.mulish(),
                        ))
                      : Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                              //border: Border.all(color: Colors.black, width: 3.0),
                              borderRadius: BorderRadius.circular(20)),
                          height: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    value.checkout[index].imageURL,
                                    width: 120,
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.checkout[index].name,
                                    style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Size: ${value.checkout[index].size}",
                                    style: GoogleFonts.mulish(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "\$ ${value.checkout[index].totalPrice.toStringAsFixed(2)}",
                                    style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.brown.shade500),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white)),
                                    onPressed: () => value
                                        .removeCoffee(value.checkout[index]),
                                    child: Text(
                                      "Delete Items",
                                      style: GoogleFonts.mulish(fontSize: 15),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                },
              )
            ],
          ),
        ));
  }
}
