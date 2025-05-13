import 'dart:developer';

import 'package:syn_log_interface/syn_log_interface.dart';
import 'package:syn_logger_console_writer/src/console_formatter.dart';

/// Default [LogWriter] for write into console.
///
/// Work with IDE console, web console.
class ConsoleWriter implements LogWriter {
  @override
  final ConsoleFormatter formatter = ConsoleFormatter();

  @override
  void write(LogEvent event) {
    log(
      formatter.format(event),
      name: event.sourceName,
      stackTrace: formatter.formatStackTrace(event.stackTrace),
      time: event.time,
      level: event.level.weight,
    );
  }
}
