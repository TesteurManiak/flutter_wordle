enum LogSeverity {
  /// The log entry has no assigned severity level.
  normal('DEFAULT'),

  /// Debug or trace information.
  debug('DEBUG'),

  /// Routine information, such as ongoing status or performance.
  info('INFO'),

  /// Normal but significant events, such as start up, shut down, or
  /// a configuration change.
  notice('NOTICE'),

  /// Warning events might cause problems.
  warning('WARNING'),

  /// Error events are likely to cause problems.
  error('ERROR'),

  /// Critical events cause more severe problems or outages.
  critical('CRITICAL'),

  /// A person must take an action immediately.
  alert('ALERT'),

  /// One or more systems are unusable.
  emergency('EMERGENCY');

  const LogSeverity(this.label);

  final String label;

  @override
  String toString() => label;
}
