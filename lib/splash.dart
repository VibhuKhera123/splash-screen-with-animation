import 'package:camp_yellow_internship/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final double _width = 300;
  final double _height = 300;
  final double _radius = 150;
  final String _text = "Camp Yellow";
  final double _fontSize = 30;

  bool animated = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        width: animated ? MediaQuery.of(context).size.width : _width,
        height: animated ? MediaQuery.of(context).size.height : _height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(animated ? 0 : _radius),
          color: Colors.yellow,
        ),
        child: Center(
          child: Text(
            animated ? "" : _text,
            style: TextStyle(
                fontSize: animated? 80:_fontSize, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      )),
    );
  }

  Future startAnimation() async {
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    setState(() {
      animated = true;
    });
    await Future.delayed(
      const Duration(milliseconds: 1200),
    );
    Get.to(
      () => const HomePage(),
      transition: Transition.upToDown,
      duration: const Duration(milliseconds: 1500),
    );
  }
}
