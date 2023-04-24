import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/coffee.dart';

class Americano extends StatefulWidget {
  Coffee product;
  Americano({super.key, required this.product});

  @override
  State<Americano> createState() => _AmeriacnoState();
}

class _AmeriacnoState extends State<Americano> {
  List drinkSize = [
    {"text": "Basic", "image": "images/size.png"},
    {"text": "Middle", "image": "images/size.png"},
    {"text": "Large", "image": "images/size.png"},
  ];
  List<String> toppings = ["Boba", "Almond", "Cheese", "Oats"];
  int selectedSize = 0;
  int selectedTopping = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10.0), child: Icon(Icons.share))
        ],
      ),
      body: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: 300,
            width: 600,
            child: Column(
              children: [
                Container(
                  height: 140,
                  width: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.product.imageURL,
                        fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.product.name,
                  style: GoogleFonts.mulish(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "A steaming Americano cup of coffee is a delightful treat for any occasion. It has a rich aroma, a smooth taste, and a refreshing kick",
                    style: GoogleFonts.mulish(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),


          Container(
            width: 700.0,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                // Drink size

                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Drink Size",
                    style: GoogleFonts.mulish(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Container(
                  //margin: EdgeInsets.symmetric(horizontal: .0),
                  height: 110,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: drinkSize.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() => selectedSize = index);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7.0),
                          decoration: BoxDecoration(
                              color: selectedSize == index
                                  ? Colors.pink.shade100
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(90)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 10.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  drinkSize[index]["image"],
                                  width: 70,
                                ),
                                Text(
                                  drinkSize[index]["text"],
                                  style: GoogleFonts.mulish(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                //Toppings
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Toppings",
                    style: GoogleFonts.mulish(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                Container(
                  height: 40.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: toppings.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() => selectedTopping = index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectedTopping == index
                                    ? Colors.pink.shade100
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0)),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              toppings[index],
                              style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                      })),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Additional Req",
                    style: GoogleFonts.mulish(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(
                  height: 6.0,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Container(
                      decoration: const BoxDecoration(),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(width: 7.0),
                                borderRadius: BorderRadius.circular(35.0)),
                            hintStyle: GoogleFonts.mulish(),
                            hintText: "Type Something"),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
