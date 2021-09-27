/// code : 1
/// message : "Operation performed successfully"
/// data : [{"UserTaskId":224,"TaskId":1535,"TaskName":"[R] Borescope Plugs (6 stations)","Category":"Pr","Color":"RGBA(0,0,0)","SubmittedDate":"2021-09-15T18:15:39.173Z","SubmittedBy":"John User"},{"UserTaskId":615,"TaskId":1491,"TaskName":"[S] Air/Fuel Leak Check on Fuel Access Panels","Category":"Ae","Color":"RGBA(0,0,0)","SubmittedDate":"2021-09-15T13:14:52.217Z","SubmittedBy":"check usere"}]

class GetTasksForSupervisorResponseNew {
  int _code;
  String _message;
  List<Data> _data;

  int get code => _code;
  String get message => _message;
  List<Data> get data => _data;

  GetTasksForSupervisorResponseNew.empty();

  GetTasksForSupervisorResponseNew.fromJson(dynamic json) {
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

/// UserTaskId : 224
/// TaskId : 1535
/// TaskName : "[R] Borescope Plugs (6 stations)"
/// Category : "Pr"
/// Color : "RGBA(0,0,0)"
/// SubmittedDate : "2021-09-15T18:15:39.173Z"
/// SubmittedBy : "John User"

class Data {
  int _userTaskId;
  int _taskId;
  String _taskName;
  String _category;
  String _color;
  String _submittedDate;
  String _submittedBy;

  int get userTaskId => _userTaskId;
  int get taskId => _taskId;
  String get taskName => _taskName;
  String get category => _category;
  String get color => _color;
  String get submittedDate => _submittedDate;
  String get submittedBy => _submittedBy;

  Data({
      int userTaskId, 
      int taskId, 
      String taskName, 
      String category, 
      String color, 
      String submittedDate, 
      String submittedBy}){
    _userTaskId = userTaskId;
    _taskId = taskId;
    _taskName = taskName;
    _category = category;
    _color = color;
    _submittedDate = submittedDate;
    _submittedBy = submittedBy;
}

  Data.fromJson(dynamic json) {
    _userTaskId = json["UserTaskId"];
    _taskId = json["TaskId"];
    _taskName = json["TaskName"];
    _category = json["Category"];
    _color = json["Color"];
    _submittedDate = json["SubmittedDate"];
    _submittedBy = json["SubmittedBy"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["UserTaskId"] = _userTaskId;
    map["TaskId"] = _taskId;
    map["TaskName"] = _taskName;
    map["Category"] = _category;
    map["Color"] = _color;
    map["SubmittedDate"] = _submittedDate;
    map["SubmittedBy"] = _submittedBy;
    return map;
  }

}