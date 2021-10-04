class Product {
  late int id;
  late int categoryId;
  late String name;
  late int stock;
  late int price;
  late String image;
  late String description;

  Product(
      {required this.id,
        required this.categoryId,
        required this.name,
        required this.stock,
        required this.price,
        required this.image,
        required this.description});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    stock = json['stock'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['stock'] = this.stock;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}
