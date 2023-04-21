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
  List <String> drinkSize = ["Basic", "Middle", "Large"];
  List <String> toppings = ["Boba", "Almond", "Cheese", "Oats"];
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
                const SizedBox(height: 15,),
                Text(widget.product.name, style: GoogleFonts.mulish(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("A steaming Americano cup of coffee is a delightful treat for any occasion. It has a rich aroma, a smooth taste, and a refreshing kick", style: GoogleFonts.mulish(
                    color: Colors.grey
                  ), textAlign: TextAlign.center,),
                )
              ],
            ),
          ),

          const SizedBox(height: 20.0,),

          Container(
            width: 600.0,
            decoration: BoxDecoration(color: Colors.grey.shade300,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(50)
                  ),
                  child: const Text("                                         ", style: TextStyle(fontSize: 7),),
                ),

                const SizedBox(height: 15,),
                // Drink size

                Text("Drink Size", style: GoogleFonts.mulish(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),

                const SizedBox(height: 15,),

                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: drinkSize.length,
                    itemBuilder: (context, index) {
                      Image.asset("images/size.png");
                    },
                  ),
                )


                //Toppings


              ],
            ),
          )          
        ],
      ),
    );
  }
}
