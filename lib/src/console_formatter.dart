import 'package:stack_trace/stack_trace.dart';
import 'package:syn_log_interface/syn_log_interface.dart';

/// Default [LogFormatter] for console output.
///
/// Split string into multiline, prettify output.
class ConsoleFormatter implements LogFormatter {
  static const _space = '  ';

  @override
  String format(LogEvent event) {
    final builder =
        StringBuffer()
          ..write(formatTime(event.time))
          ..write(_space);
    if (event.isolateDebugName != null) {
      builder
        ..write(event.isolateDebugName)
        ..write(_space);
    }
    builder
      ..write(formatLevel(event.level))
      ..write(_space)
      ..write(event.message);

    return builder.toString();
  }

  String formatTime(DateTime time) => time.toIso8601String();

  StackTrace? formatStackTrace(StackTrace? trace) =>
      trace != null ? Trace.from(trace).terse : null;

  String formatLevel(LogLevel level) => switch (level) {
    LogLevel.verbose => '[V]',
    LogLevel.debug => '[D]',
    LogLevel.info => '[I]',
    LogLevel.warning => '[W]',
    LogLevel.error => '[E]',
    LogLevel.fatal => '[F]',
  };
}
