class GetBookletDetailForUserNew {
  int code;
  String message;
  Data data;

  GetBookletDetailForUserNew({this.code, this.message, this.data});

  GetBookletDetailForUserNew.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String color;
  String version;
  int qualificationTypeId;
  String qualificationType;
  dynamic completion;
  bool submitted;
  bool isApproved;
  bool canSubmit;
  List<Categories> categories;

  Data(
      {this.id,
        this.name,
        this.color,
        this.version,
        this.qualificationTypeId,
        this.qualificationType,
        this.completion,
        this.submitted,
        this.isApproved,
        this.canSubmit,
        this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    version = json['version'];
    qualificationTypeId = json['qualificationTypeId'];
    qualificationType = json['qualificationType'];
    completion = json['completion'];
    submitted = json['submitted'] == 0? false: true;
    isApproved = json['isApproved'] == 0? false: true;
    canSubmit = json['canSubmit'] == 0? false: true;
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['version'] = this.version;
    data['qualificationTypeId'] = this.qualificationTypeId;
    data['qualificationType'] = this.qualificationType;
    data['completion'] = this.completion;
    data['submitted'] = this.submitted;
    data['isApproved'] = this.isApproved;
    data['canSubmit'] = this.canSubmit;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String sId;
  String name;
  bool isCompleted;

  Categories({this.sId, this.name, this.isCompleted});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}