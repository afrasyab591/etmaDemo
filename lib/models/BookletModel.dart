import 'package:meta/meta.dart';
import 'dart:convert';

class BookletModel {
  BookletModel({
    @required this.code,
    @required this.message,
    @required this.data,
  });

  final int code;
  final String message;
  final List<Result> data;


  factory BookletModel.fromJson(Map<String,dynamic> map) => BookletModel.fromMap(map);

  String toJson() => json.encode(toMap());

  factory BookletModel.fromMap(Map<String, dynamic> json) => BookletModel(
    code: json["code"],
    message: json["message"],
    data: List<Result>.from(json["data"].map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Result {
  Result({
    @required this.userBookletId,
    @required this.id,
    @required this.name,
    @required this.color,
    @required this.version,
    @required this.qualificationTypeId,
    @required this.qualificationType,
    @required this.completion,
    @required this.submitted,
    @required this.isDirectApprove,
    @required this.bookletType,
  });

  final int userBookletId;
  final int id;
  final String name;
  final String version;
  final int qualificationTypeId;
  final String qualificationType;
  final String color;
  final dynamic completion;
  final bool submitted;
  final bool isDirectApprove;
  final String bookletType;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    userBookletId: json["userBookletId"],
    id: json["_id"],
    name: json["name"],
    version: json["version"],
    qualificationTypeId: json["qualificationTypeId"],
    qualificationType: json["qualificationType"],
    color: json["color"],
    completion: json["completion"],
    submitted: json["submitted"] == 0? false: true,
    isDirectApprove: json["isDirectApprove"] == 0? false: true,
    bookletType: json["bookletType"],
  );

  Map<String, dynamic> toMap() => {
    "userBookletId": userBookletId,
    "_id": id,
    "name": name,
    "version": version,
    "qualificationTypeId": qualificationTypeId,
    "qualificationType": qualificationType,
    "color": color,
    "completion": completion,
    "submitted": submitted,
    "isDirectApprove": isDirectApprove,
    "bookletType": bookletType,
  };
}
