enum StatusCode {
  ok(200),
  methodNotAllowed(405);

  const StatusCode(this.code);

  final int code;
}
