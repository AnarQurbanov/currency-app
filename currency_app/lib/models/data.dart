class Data {
  String? id;
  String? name;
  String? minSize;

  Data({this.id, this.name, this.minSize});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    minSize = json['min_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['min_size'] = this.minSize;
    return data;
  }
}