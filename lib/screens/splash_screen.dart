import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCDDFC),
      body: Stack(
        children: [
          TweenAnimationBuilder(
            duration: const Duration(seconds: 2),
            tween: Tween<double>(begin: 0, end: 1),
            curve: Curves.bounceOut,
            onEnd: () {
              context.push("/home");
            },
            builder: (context, double value, child) {
              return Positioned(
                top: value * 400,
                left: 0.0,
                right: 0.0,
                child: Hero(
                  tag: "logo",
                  child: Image.asset(
                    "assets/logo.png",
                    height: 92,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
