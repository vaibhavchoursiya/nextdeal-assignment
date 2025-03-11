import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  late Timer timer;
  int currentIndex = 0;
  List<String> textList = [
    "Find Your Dream\nHome with Ease!",
    "Learn, Build,\nRepeat! asdfasdf",
    "Create Amazing \nUI! asdfasd",
    "Master Animation!\nsdfasdf",
    "Keep Coding! \nadsfasd asdfasdf",
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      currentIndex = (currentIndex + 1) % textList.length;
      _pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0.0,
            top: -110.0,
            child: TweenAnimationBuilder(
              duration: Duration(milliseconds: 700),
              tween: Tween(begin: MediaQuery.of(context).size, end: Size(0, 0)),
              curve: Curves.linear,
              builder: (context, value, child) {
                return Container(
                  width: value.width + 110,
                  height: value.height,
                  decoration: BoxDecoration(
                    color: Color(0xFFCCDDFC),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(550),
                      // bottomLeft: Radius.circular(100),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Hero(
                      tag: "logo",
                      child: Image.asset(
                        "assets/logo.png",
                        height: 52,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),

              Container(
                height: 120.0,
                padding: const EdgeInsets.only(left: 26.0),
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _pageController,
                  itemCount: textList.length,
                  itemBuilder: (context, index) {
                    return Text(
                      textList[index],
                      style: GoogleFonts.roboto(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
