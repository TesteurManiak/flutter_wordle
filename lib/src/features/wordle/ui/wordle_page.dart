import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_wordle/src/features/wordle/data/datasources/wordle_remote_datasource.dart';
import 'package:flutter_wordle/src/features/wordle/data/models/letter_feedback.dart';
import 'package:flutter_wordle/src/features/wordle/ui/widgets/word_input_field.dart';

class WordlePage extends StatefulWidget {
  const WordlePage({super.key});

  @override
  State<WordlePage> createState() => _WordlePageState();
}

class _WordlePageState extends State<WordlePage> {
  final attemptLetters = <LetterFeedback?>[];

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: WordInputField(
              wordLength: 5,
              enabled: attemptLetters.length < 30,
              onSubmit: attemptLetters.length < 30 && !isLoading ? onWordSubmit : null,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 36),
            sliver: SliverGrid.builder(
              itemCount: 30,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: kWordCellSpacing,
                mainAxisSpacing: kWordCellSpacing,
              ),
              itemBuilder: (context, index) {
                final letter = attemptLetters.elementAtOrNull(index);
                return _ColorCell(letter);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onWordSubmit(String guess) async {
    setState(() => isLoading = true);
    final newColors = await wordleRemoteDatasource.instance.guessWord(guess);
    setState(() {
      attemptLetters.addAll(newColors);
      isLoading = false;
    });
    if (newColors.every((l) => l.isValid)) launchConfetti();
  }

  void launchConfetti() {
    final rnd = Random();
    double randomInRange(double min, double max) => min + rnd.nextDouble() * (max - min);

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
          y: rnd.nextDouble() - 0.2,
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
          y: rnd.nextDouble() - 0.2,
        ),
      );
    });
  }
}

class _ColorCell extends StatelessWidget {
  const _ColorCell(this.letter);

  final LetterFeedback? letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: switch (letter) {
          LetterFeedback(:final color) => color,
          _ => null,
        },
        borderRadius: BorderRadius.circular(4),
        border: letter == null ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: switch (letter) {
        final letter? => Text(letter.letter, textAlign: TextAlign.center),
        _ => null,
      },
    );
  }
}
