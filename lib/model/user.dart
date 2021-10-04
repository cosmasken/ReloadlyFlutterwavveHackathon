class User {
  late int id;
  late String name;
  late String email;
  late String phonenumber;
  late String image;

  User(
      {required this.id,
        required this.name,
        required this.email,
        required this.phonenumber,
        required this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phonenumber'] = this.phonenumber;
    data['image'] = this.image;
    return data;
  }
}
