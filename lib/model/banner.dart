class Promobanner {
  late int id;
  late String title;
  late String description;
  late String imageurl;
  late String color;

  Promobanner({required this.id, required this.title, required this.description, required this.imageurl, required this.color});

  Promobanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imageurl = json['imageurl'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['imageurl'] = this.imageurl;
    data['color'] = this.color;
    return data;
  }
}
