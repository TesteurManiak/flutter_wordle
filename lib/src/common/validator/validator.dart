class Validator<T> {
  const Validator({this.rules = const []});

  final List<Rule<T>> rules;

  String? call(T value) {
    for (final rule in rules) {
      final error = rule.validate(value);
      if (error != null) {
        return error;
      }
    }
    return null;
  }
}

abstract class Rule<T> {
  const Rule({this.errorMessage});

  final String? errorMessage;

  String? validate(T value);
}

class NotEmptyRule<T> extends Rule<T> {
  const NotEmptyRule({super.errorMessage});

  @override
  String? validate(T value) {
    final msg = errorMessage ?? 'This field cannot be empty';
    return switch (value) {
      final String str when str.isEmpty => msg,
      final Iterable it when it.isEmpty => msg,
      null => msg,
      _ => null,
    };
  }
}
