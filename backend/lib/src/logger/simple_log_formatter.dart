import 'package:backend/src/logger/log_formatter.dart';
import 'package:backend/src/logger/log_severity.dart';
import 'package:stack_trace/stack_trace.dart';

/// Formats the log data into a simple format for local output logging
LogFormatter formatSimpleLog() => ({
      required LogSeverity severity,
      required String message,
      bool? isError,
      Chain? chain,
      Frame? stackFrame,
    }) {
      final buffer = StringBuffer()..write('[$severity] $message');
      if (stackFrame != null) {
        buffer
          ..writeln()
          ..write('  ')
          ..write(stackFrame.library)
          ..write(':')
          ..write(stackFrame.line)
          ..write(':')
          ..write(stackFrame.column)
          ..write(' (')
          ..write(stackFrame.member)
          ..write(')');
      }

      if (chain != null) {
        buffer
          ..writeln()
          ..write(chain.toString().trim());
      }

      buffer.writeln();

      return buffer.toString();
    };
