import 'dart:io';

import 'package:backend/src/logger/log_formatter.dart';
import 'package:backend/src/logger/log_severity.dart';
import 'package:collection/collection.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:meta/meta.dart';
import 'package:stack_trace/stack_trace.dart';

extension LoggerContextExtension on RequestContext {
  /// Returns the [Logger] instance from the context.
  Logger get logger => read<Logger>();
}

class Logger {
  const Logger({
    required LogFormatter logFormatter,
    @visibleForTesting Stdout? testingStdout,
  })  : _logFormatter = logFormatter,
        _testingStdout = testingStdout;

  final LogFormatter _logFormatter;
  final Stdout? _testingStdout;

  /// Log an event with debug or trace information.
  void debug(String message) => log(LogSeverity.debug, message);

  /// Log an event with routine information, such as ongoing status or
  /// performance.
  void info(String message) => log(LogSeverity.info, message);

  /// Log an event that is likely to cause problems.
  void error(String message) => log(LogSeverity.error, message);

  void log(
    LogSeverity severity,
    String message, {
    StackTrace? stackTrace,
    bool isError = false,
    bool includeStacktrace = false,
    bool includeSourceLocation = true,
    List<String> packageExcludeList = const [
      'dart_frog',
      'shelf',
      'request_logger',
    ],
  }) {
    final resolvedStdout = _testingStdout ?? stdout;
    final chain =
        (stackTrace != null ? Chain.forTrace(stackTrace) : Chain.current())
            .foldFrames(
      (f) => f.isCore || packageExcludeList.contains(f.package),
      terse: true,
    );
    final stackFrame = frameFromChain(
      chain,
      packageExcludeList: packageExcludeList,
    );

    final logString = _logFormatter(
      severity: severity,
      message: message,
      isError: isError,
      chain: includeStacktrace ? chain : null,
      stackFrame: includeSourceLocation ? stackFrame : null,
    );
    resolvedStdout.writeln(logString);
  }
}

/// Returns a [Frame] from [chain] if possible, otherwise, `null`.
Frame? frameFromChain(
  Chain? chain, {
  List<String> packageExcludeList = const [],
}) {
  if (chain == null || chain.traces.isEmpty) return null;

  final trace = chain.traces.first;
  if (trace.frames.isEmpty) return null;

  final frame = trace.frames.firstWhereOrNull(
    (frame) => !packageExcludeList.contains(frame.package),
  );

  return frame ?? trace.frames.first;
}
