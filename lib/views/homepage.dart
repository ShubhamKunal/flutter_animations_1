import 'package:flutter/material.dart';
import 'dart:math' show pi;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        Tween<double>(begin: 0.0, end: 2 * pi).animate(animationController);

    animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              // origin: Offset(50, 50),  //USE LESS OFTEN
              transform: Matrix4.identity()
                ..rotateY(animation.value), //identity() - identity matrices
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
