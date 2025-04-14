import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    const MaterialApp(
      home: ColorChangerApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ColorChangerApp extends StatefulWidget {
  const ColorChangerApp({super.key});

  @override
  State<ColorChangerApp> createState() => _ColorChangerAppState();
}

class _ColorChangerAppState extends State<ColorChangerApp> {
  var backgroundColor = const Color.fromARGB(255, 44, 112, 47);
  var directionIndex = 0;

  final List<List<Alignment>> directions = [
    [Alignment.topCenter, Alignment.bottomCenter],
    [Alignment.centerLeft, Alignment.centerRight],
    [Alignment.topRight, Alignment.bottomLeft],
    [Alignment.topLeft, Alignment.bottomRight],
  ];

  final List<String> directionNames = [
    "Vertical",
    "Horizontal",
    "Right-Left",
    "Left-Right",
  ];

  void changeColor() {
    final random = Random();
    setState(() {
      backgroundColor = Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    });
  }

  void changeDirection() {
    setState(() {
      directionIndex = (directionIndex + 1) % directions.length;
    });
  }

  String getDirectionLabel() {
    return 'Direction: ${directionNames[directionIndex]}';
  }

  @override
  Widget build(BuildContext context) {
    final currentDirection = directions[directionIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundColor, Colors.white, backgroundColor],
            stops: [0.0, 0.5, 1.0],
            begin: currentDirection[0],
            end: currentDirection[1],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: changeColor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Change Color',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Red: ${backgroundColor.red}  Green: ${backgroundColor.green}  Blue: ${backgroundColor.blue}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: changeDirection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Change Direction',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                getDirectionLabel(),
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
