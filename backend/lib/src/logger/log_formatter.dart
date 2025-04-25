import 'package:backend/src/logger/log_severity.dart';
import 'package:stack_trace/stack_trace.dart';

/// A function that formats a new log string.
///
/// - [severity]: The severity level of a log
/// - [message]: The message to be logged
/// - [isError]: True if this log should be considered an error,
///   such as reporting to an error monitoring service
/// - [chain]: A chain that can be printed as a stacktrace using `toString()`.
///   Will be set if available.
/// - [stackFrame]: The top frame in the stacktrace, which represents the frame
///   that called the logger. Will be set if available.
typedef LogFormatter = String Function({
  required LogSeverity severity,
  required String message,
  bool? isError,
  Chain? chain,
  Frame? stackFrame,
});
