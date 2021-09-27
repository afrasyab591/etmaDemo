/// code : 1
/// message : "Operation performed successfully"
/// data : {"message":"Booklet approved"}

class ApproveBookletBySupervisorResponse {
  int _code;
  String _message;
  Data _data;

  int get code => _code;
  String get message => _message;
  Data get data => _data;

//   ApproveBookletBySupervisorResponse({
//       int code,
//       String message,
//       Data data}){
//     _code = code;
//     _message = message;
//     _data = data;
// }
  ApproveBookletBySupervisorResponse.empty();

  ApproveBookletBySupervisorResponse.fromJson(dynamic json) {
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

/// message : "Booklet approved"

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