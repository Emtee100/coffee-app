// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../components/appbar.dart';
import '../components/banner1.dart';
import '../components/banner2.dart';
import '../components/banner3.dart';
import '../components/banner4.dart';
import '../components/bottomnavbar.dart';
import '../models/coffee.dart';
import '../widgets/beverages.dart';
import '../widgets/foods.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Coffee> homeCoffee = [
    Coffee(name: "Americano", price: 2.05, imageURL: "images/coffee 1.jpg"),
    Coffee(name: "Macchiato", price: 2.15, imageURL: "images/coffee 2.jpg"),
  ];

  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Appbar(),

              // Page view banners

              Container(
                height: 250,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: const [
                    Banner1(),
                    Banner2(),
                    Banner3(),
                    Banner4(),
                  ],
                ),
              ),
              SmoothPageIndicator(
                count: 4,
                controller: _controller,
                effect: ScrollingDotsEffect(
                    dotColor: Colors.grey,
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: Colors.brown.shade600),
              ),

              // Beverages section

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Beverages',
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w700,
                        fontSize: 19.0,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: GoogleFonts.mulish(
                            color: Colors.purple.shade300,
                          ),
                        ))
                  ],
                ),
              ),

              SizedBox(
                height: 10.0,
              ),

              Beverages(),

              // Foods section

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Foods',
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w700,
                        fontSize: 19.0,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: GoogleFonts.mulish(
                            color: Colors.purple.shade300,
                          ),
                        ))
                  ],
                ),
              ),

              SizedBox(
                height: 8.0,
              ),

              Foods(),

              // items
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                height: 250,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: homeCoffee.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        childAspectRatio: 2 / 3),
                    itemBuilder: (context, index) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              homeCoffee[index].imageURL,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),    
                              borderRadius: BorderRadius.circular(13)                                      
                            ),
                          ),
                          Positioned(
                            right: 10.0,
                            top: 10.0,
                            child: Container(
                              padding: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text(
                                '\$ ${homeCoffee[index].price}',
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w600
                              ),),
                            ),
                          ),

                          Positioned(
                            bottom: 20.0,
                            left: 10.0,
                            child: Container(
                              child: Text(homeCoffee[index].name, style: GoogleFonts.mulish(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ), softWrap: true,),
                            ),
                          )

                          
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          
        )
      ),
    );
  }
}
