import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_wordle/src/features/wordle/data/datasources/wordle_remote_datasource.dart';
import 'package:flutter_wordle/src/features/wordle/ui/widgets/word_input_field.dart';

class WordlePage extends StatefulWidget {
  const WordlePage({super.key});

  @override
  State<WordlePage> createState() => _WordlePageState();
}

class _WordlePageState extends State<WordlePage> {
  late final Future<String> secretWordFuture;

  @override
  void initState() {
    super.initState();
    secretWordFuture = wordleRemoteDatasource.instance.getWord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: secretWordFuture,
        builder: (context, snapshot) {
          if (snapshot.data case final secretWord? when snapshot.hasData) return _Loaded(secretWord);
          if (snapshot.error case final error? when snapshot.hasError) {
            return Center(
              child: Padding(padding: EdgeInsets.all(16), child: Text(error.toString(), textAlign: TextAlign.center)),
            );
          }
          return const Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}

class _Loaded extends StatefulWidget {
  const _Loaded(this.secretWord);

  final String secretWord;

  @override
  State<_Loaded> createState() => _LoadedState();
}

class _LoadedState extends State<_Loaded> {
  static const maxAttempts = 6;

  Map<int, List<_GuessedLetter>> attemptLines = {};
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
              wordLength: widget.secretWord.length,
              enabled: attempts < maxAttempts,
              onSubmit: attempts < maxAttempts ? onWordSubmit : null,
            ),
            for (final letters in attemptLines.values) _ColorRow(letters: letters),
          ],
        ),
      ),
    );
  }

  void onWordSubmit(String guess) {
    final newColors = checkWord(guess, widget.secretWord.toUpperCase());
    setState(() => attemptLines[attempts] = newColors.toList());

    if (newColors.every((l) => l.valid)) {
      launchConfetti();
    }
    setState(() => attempts++);
  }

  Iterable<_GuessedLetter> checkWord(String guess, String secret) sync* {
    final secretLetters = secret.split('');
    final guessLetters = guess.split('');
    for (var i = 0; i < guessLetters.length; i++) {
      final guessLetter = guessLetters[i];
      if (guessLetters[i] == secretLetters[i]) {
        yield _GuessedLetter(letter: guessLetter, color: Colors.green);
      } else if (secretLetters.contains(guessLetters[i])) {
        yield _GuessedLetter(letter: guessLetter, color: Colors.yellow);
      } else {
        yield _GuessedLetter(letter: guessLetter, color: Colors.red);
      }
    }
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

  final List<_GuessedLetter> letters;

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

  final _GuessedLetter letter;

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

class _GuessedLetter {
  const _GuessedLetter({required this.letter, required this.color});

  final String letter;
  final Color color;

  bool get valid => color == Colors.green;
}
