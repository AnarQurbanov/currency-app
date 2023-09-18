class FromTo {
  bool? success;
  bool? historical;
  String? date;
  num? result;

  FromTo({this.success, this.historical, this.date, this.result});

  FromTo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    historical = json['historical'];
    date = json['date'];
    result = json['result'];
  }
}
