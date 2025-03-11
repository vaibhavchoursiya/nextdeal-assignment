import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({
    super.key,
    required PageController pageController,
    required this.textList,
  }) : _pageController = pageController;

  final PageController _pageController;
  final List<String> textList;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
