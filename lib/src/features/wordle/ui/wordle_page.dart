import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_wordle/src/features/wordle/data/datasources/wordle_remote_datasource.dart';
import 'package:flutter_wordle/src/features/wordle/data/models/letter_feedback.dart';
import 'package:flutter_wordle/src/features/wordle/ui/widgets/word_input_field.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Loaded());
  }
}

class _Loaded extends StatefulWidget {
  const _Loaded();

  @override
  State<_Loaded> createState() => _LoadedState();
}

class _LoadedState extends State<_Loaded> {
  static const maxAttempts = 6;

  Map<int, List<LetterFeedback>> attemptLines = {};
  int attempts = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            WordInputField(
              wordLength: 5,
              enabled: attempts < maxAttempts,
              onSubmit: attempts < maxAttempts ? onWordSubmit : null,
            ),
            for (final letters in attemptLines.values) _ColorRow(letters: letters),
          ],
        ),
      ),
    );
  }

  Future<void> onWordSubmit(String guess) async {
    final newColors = await wordleRemoteDatasource.instance.guessWord(guess);
    setState(() => attemptLines[attempts] = newColors);

    if (newColors.every((l) => l.isValid)) {
      launchConfetti();
    }
    setState(() => attempts++);
  }

  void launchConfetti() {
    double randomInRange(double min, double max) {
      return min + Random().nextDouble() * (max - min);
    }

    int total = 60;
    int progress = 0;

    Timer.periodic(const Duration(milliseconds: 250), (timer) {
      progress++;

      if (progress >= total) {
        timer.cancel();
        return;
      }

      int count = ((1 - progress / total) * 50).toInt();

      Confetti.launch(
        context,
        options: ConfettiOptions(
          particleCount: count,
          startVelocity: 30,
          spread: 360,
          ticks: 60,
          x: randomInRange(0.1, 0.3),
          y: Random().nextDouble() - 0.2,
        ),
      );
      Confetti.launch(
        context,
        options: ConfettiOptions(
          particleCount: count,
          startVelocity: 30,
          spread: 360,
          ticks: 60,
          x: randomInRange(0.7, 0.9),
          y: Random().nextDouble() - 0.2,
        ),
      );
    });
  }
}

class _ColorRow extends StatelessWidget {
  const _ColorRow({required this.letters});

  final List<LetterFeedback> letters;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: kWordCellSpacing,
      children: [for (final letter in letters) _ColorCell(letter)],
    );
  }
}

class _ColorCell extends StatelessWidget {
  const _ColorCell(this.letter);

  final LetterFeedback letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: kWordCellSize,
      height: kWordCellSize,
      decoration: BoxDecoration(color: letter.color, borderRadius: BorderRadius.circular(4)),
      child: Text(letter.letter, textAlign: TextAlign.center),
    );
  }
}
