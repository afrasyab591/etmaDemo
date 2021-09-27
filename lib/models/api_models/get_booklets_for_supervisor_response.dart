/// code : 1
/// message : "Operation performed successfully"
/// data : [{"userBookletId":81,"id":1045,"name":"CLP","category":"Tech","color":"RGBA(0,0,0,0)","completion":0,"submittedBy":"John User","submittedDate":"2021-09-16T00:00:00.000Z"}]

class GetBookletsForSupervisorResponse {
  int _code;
  String _message;
  List<Data> _data;

  int get code => _code;
  String get message => _message;
  List<Data> get data => _data;

  GetBookletsForSupervisorResponse.empty();

  GetBookletsForSupervisorResponse.fromJson(dynamic json) {
    _code = json["code"];
    _message = json["message"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// userBookletId : 81
/// id : 1045
/// name : "CLP"
/// category : "Tech"
/// color : "RGBA(0,0,0,0)"
/// completion : 0
/// submittedBy : "John User"
/// submittedDate : "2021-09-16T00:00:00.000Z"

class Data {
  int _userBookletId;
  int _id;
  String _name;
  String _category;
  String _color;
  int _completion;
  String _submittedBy;
  String _submittedDate;

  int get userBookletId => _userBookletId;
  int get id => _id;
  String get name => _name;
  String get category => _category;
  String get color => _color;
  int get completion => _completion;
  String get submittedBy => _submittedBy;
  String get submittedDate => _submittedDate;

  Data({
      int userBookletId, 
      int id, 
      String name, 
      String category, 
      String color, 
      int completion, 
      String submittedBy, 
      String submittedDate}){
    _userBookletId = userBookletId;
    _id = id;
    _name = name;
    _category = category;
    _color = color;
    _completion = completion;
    _submittedBy = submittedBy;
    _submittedDate = submittedDate;
}

  Data.fromJson(dynamic json) {
    _userBookletId = json["userBookletId"];
    _id = json["id"];
    _name = json["name"];
    _category = json["category"];
    _color = json["color"];
    _completion = json["completion"];
    _submittedBy = json["submittedBy"];
    _submittedDate = json["submittedDate"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["userBookletId"] = _userBookletId;
    map["id"] = _id;
    map["name"] = _name;
    map["category"] = _category;
    map["color"] = _color;
    map["completion"] = _completion;
    map["submittedBy"] = _submittedBy;
    map["submittedDate"] = _submittedDate;
    return map;
  }

}