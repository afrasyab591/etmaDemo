/// code : 1
/// message : "Operation performed successfully"
/// data : {"message":"Task approved"}

class ApproveTaskBySupervisorResponse {
  int _code;
  String _message;
  Data _data;

  int get code => _code;
  String get message => _message;
  Data get data => _data;

  ApproveTaskBySupervisorResponse.empty();

  ApproveTaskBySupervisorResponse.fromJson(dynamic json) {
    _code = json["code"];
    _message = json["message"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

/// message : "Task approved"

class Data {
  String _message;

  String get message => _message;

  Data({
      String message}){
    _message = message;
}

  Data.fromJson(dynamic json) {
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = _message;
    return map;
  }

}