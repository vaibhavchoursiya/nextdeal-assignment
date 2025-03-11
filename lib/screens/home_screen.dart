import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nextdeal_app/widgets/animated_text_widget.dart';
import 'package:nextdeal_app/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _textScrollController = PageController();
  PageController _carouselController = PageController();

  bool startDragAnimation = false;

  late Timer timer;
  int currentIndex = 0;
  List<String> textList = [
    "Find Your Dream\nHome with Ease!",
    "Learn, Build,\nRepeat! asdfasdf",
    "Create Amazing \nUI! asdfasd",
    "Master Animation!\nsdfasdf",
    "Keep Coding! \nadsfasd asdfasdf",
  ];

  List<String> imageUrl = List.generate(5, (e) {
    return "https://picsum.photos/200/300";
  });

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      currentIndex = (currentIndex + 1) % textList.length;
      _textScrollController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _carouselController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    _textScrollController.dispose();
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
              duration: Duration(milliseconds: 1400),
              tween: Tween(begin: MediaQuery.of(context).size, end: Size(0, 0)),
              curve: Curves.linear,
              onEnd: () {
                startDragAnimation = true;
                setState(() {});
              },
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
            children: [const SizedBox(height: 48.0), Navbar()],
          ),

          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: startDragAnimation ? 100 : 500,
            left: 0.0,
            right: 0.0,
            height: 750,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 32.0),

                  AnimatedTextWidget(
                    pageController: _textScrollController,
                    textList: textList,
                  ),
                  const SizedBox(height: 12.0),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    height: 420.0,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      controller: _carouselController,
                      onPageChanged: (value) {
                        currentIndex = value;
                        setState(() {});
                      },

                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          height: 420.0,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,

                              image: NetworkImage(imageUrl[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(imageUrl.length, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: currentIndex == index ? 40 : 10,
                        height: 10,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color:
                              currentIndex == index
                                  ? Colors.blue
                                  : Color(0xFFCCDDFC),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 24.0),

                  Container(
                    width: double.infinity,

                    height: 60.0,
                    margin: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
