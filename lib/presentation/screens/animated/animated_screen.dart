import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    setState(() {
      width = Random().nextInt(300).toDouble() + 50;
      height = Random().nextInt(300).toDouble() + 50;
      color = Color.fromARGB(
        255,
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextInt(255),
      );
      borderRadius = Random().nextInt(100).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Screen')),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          alignment: Alignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeShape(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
