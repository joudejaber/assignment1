import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    const MaterialApp(
      home: RockPaperScissorsApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class RockPaperScissorsApp extends StatefulWidget {
  const RockPaperScissorsApp({super.key});

  @override
  State<RockPaperScissorsApp> createState() => _RockPaperScissorsAppState();
}

class _RockPaperScissorsAppState extends State<RockPaperScissorsApp> {
  final List<String> choices = ['✊', '✌️', '✋'];
  final List<String> imageNames = ['rock.jpeg', 'scissors.png', 'paper.jpeg'];

  String playerChoice = '❓';
  String computerChoice = '❓';
  String result = '';
  int playerScore = 0;
  int computerScore = 0;

  void makeChoice(int index) {
    final random = Random();
    final compIndex = random.nextInt(3);

    setState(() {
      playerChoice = choices[index];
      computerChoice = choices[compIndex];

      if (index == compIndex) {
        result = 'It is a Tie 🙂';
      } else if ((index == 0 && compIndex == 1) ||
          (index == 1 && compIndex == 2) ||
          (index == 2 && compIndex == 0)) {
        result = 'You Win 😎';
        playerScore++;
      } else {
        result = 'You Lose 😕';
        computerScore++;
      }
    });
  }

  void resetGame() {
    setState(() {
      playerChoice = '❓';
      computerChoice = '❓';
      result = '';
      playerScore = 0;
      computerScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 98, 150, 255),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "Let's Play Rock-Paper-Scissors",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'You: $playerChoice',
                style: const TextStyle(fontSize: 22, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                'Computer: $computerChoice',
                style: const TextStyle(fontSize: 22, color: Colors.black),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () => makeChoice(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/${imageNames[index]}',
                        width: 60,
                        height: 60,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Your Score: $playerScore   Computer Score: $computerScore',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              IconButton(
                onPressed: resetGame,
                icon: const Icon(Icons.refresh),
                color: Colors.red,
                iconSize: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
