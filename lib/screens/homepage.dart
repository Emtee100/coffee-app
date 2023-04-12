import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../components/appbar.dart';
import '../components/banner1.dart';
import '../components/banner2.dart';
import '../components/banner3.dart';
import '../components/banner4.dart';

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
        body: Column(
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
            )

            // Beverages section

            // Foods section

            // items
          ],
        ),
      ),
    );
  }
}
