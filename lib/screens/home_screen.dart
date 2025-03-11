import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }
}
