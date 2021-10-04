class Category {
  late int id;
  late String name;
  late String image;
  late String color;

  Category({required this.id, required this.name, required this.image, required this.color});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['color'] = this.color;
    return data;
  }
}
