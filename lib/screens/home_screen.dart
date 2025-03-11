import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            children: [
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(18.0),
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
            ],
          ),
        ],
      ),
    );
  }
}
