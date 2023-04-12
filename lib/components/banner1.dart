import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Banner1 extends StatelessWidget {
  const Banner1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("images/banner 1.jpg")),
            ),
            Positioned(
                left: 50.0,
                bottom: 35.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Share Happiness",
                      style: GoogleFonts.mulish(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Buy 1 Get 1",
                      style: GoogleFonts.mulish(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.brown.shade600,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text("Find out more",
                          style: GoogleFonts.mulish(color: Colors.white)),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
