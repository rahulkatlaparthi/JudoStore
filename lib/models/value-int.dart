class ValueResponse {
  int? value;

  ValueResponse({this.value});

  factory ValueResponse.fromJson(Map<String, dynamic> parsedJson) {
    return ValueResponse(value: parsedJson['value']);
  }
}
