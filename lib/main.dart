import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const RockPaperScissorsApp());
}

class RockPaperScissorsApp extends StatelessWidget {
  const RockPaperScissorsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rock Paper Scissors",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'vazir',
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Random _random = Random();

  int playerChoice = 1; // 1 = rock, 2 = paper, 3 = scissors
  int computerChoice = 1;
  String result = "Click START to play!";

  int getRandomChoice() => _random.nextInt(3) + 1;

  String getChoiceName(int value) {
    switch (value) {
      case 1:
        return "Rock";
      case 2:
        return "Paper";
      case 3:
        return "Scissors";
      default:
        return "";
    }
  }

  String getResult(int p, int c) {
    if (p == c) return "It's a tie!";
    if ((p == 1 && c == 3) || (p == 2 && c == 1) || (p == 3 && c == 2)) {
      return "You Win!";
    } else {
      return "Computer Wins!";
    }
  }

  void startGame() {
    setState(() {
      playerChoice = getRandomChoice();
      computerChoice = getRandomChoice();
      result = getResult(playerChoice, computerChoice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Rock Paper Scissors"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Result Text
            Text(
              result,
              style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            // Computer Move
            Column(
              children: [
                const Text("Computer",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Image.asset("images/$computerChoice.png", height: 120),
                Text(getChoiceName(computerChoice),
                    style: const TextStyle(color: Colors.white)),
              ],
            ),

            // Player Move
            Column(
              children: [
                const Text("You",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Image.asset("images/$playerChoice.png", height: 120),
                Text(getChoiceName(playerChoice),
                    style: const TextStyle(color: Colors.white)),
              ],
            ),

            // Start Button
            ElevatedButton(
              onPressed: startGame,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                "START GAME",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
