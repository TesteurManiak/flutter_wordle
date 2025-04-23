import 'package:backend/src/models/letter_feedback.dart';
import 'package:dart_frog/dart_frog.dart';

class RandomWordResponse extends Response {
  RandomWordResponse({
    required this.feedback,
    required this.correct,
  });

  final List<LetterFeedback> feedback;
  final bool correct;
}
