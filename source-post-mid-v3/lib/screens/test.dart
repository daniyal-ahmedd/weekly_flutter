import 'dart:math';
import 'package:flutter/material.dart';

class DiceRollScreen extends StatefulWidget {
  const DiceRollScreen({super.key});

  @override
  State<DiceRollScreen> createState() => _DiceRollScreenState();
}

class _DiceRollScreenState extends State<DiceRollScreen> {
  int diceRollResult = 1;
  String roll_message = "";

  int getRandomRoll() {
    final randomNumber = Random().nextInt(6) + 1;
    return randomNumber;
  }

  void rollDice() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Roll"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Text(roll_message),
            ElevatedButton(
              onPressed: rollDice,
              child: Text("Roll Dice"),
            ),
          ],
        ),
      ),
    );
  }
}
