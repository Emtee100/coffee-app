// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../components/appbar.dart';
import '../components/banner1.dart';
import '../components/banner2.dart';
import '../components/banner3.dart';
import '../components/banner4.dart';
import '../widgets/beverages.dart';
import '../widgets/foods.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  

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
        
              SizedBox(height: 8.0,),
        
              Foods(),

              // items
              
              
            ],
          ),
        ),
      ),
    );
  }
}
