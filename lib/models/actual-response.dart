class ActualResponse<T> {
  bool? success;
  String? message;
  T? returnValue;

  ActualResponse({this.success, this.message, this.returnValue});

  factory ActualResponse.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    // final returnValue = json['returnValue']?.cast<Map<String, dynamic>>();
    return ActualResponse<T>(
        success: json['success'],
        message: json['message'],
        returnValue: getReturnValue(json, fromJsonModel));
  }

  static dynamic getReturnValue(
      Map<String, dynamic> json, Function fromJsonModel) {
    if (json['returnValue'] != null) {
      if (json['returnValue'] is int) {
        return json['returnValue'] as int;
      } else if (json['returnValue'] is String) {
        return json['returnValue'] as String;
      } else if (json['returnValue'] is bool) {
        return json['returnValue'] as bool;
      } else {
        return fromJsonModel(json['returnValue']);
      }
    }
    return null;
  }
}
