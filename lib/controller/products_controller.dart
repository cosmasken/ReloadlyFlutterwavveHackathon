import 'dart:convert';

import 'package:get/get.dart';
import 'package:swarp/model/product.dart';
import 'package:http/http.dart' as http;

class ProductsController extends GetxController {
  var cartproducts = <Product>[].obs;
  var allproducts = <Product>[].obs;
  @override
  void onInit() {
    getproducts();

    super.onInit();
  }
  addProducttoCart(
    int id,
    int categoryId,
    String name,
    int stock,
    int price,
    String image,
    String description,
  ) async {
    cartproducts.add(Product(
      id: id,
      categoryId: categoryId,
      name: name,
      stock: stock,
      price: price,
      image: image,
      description: description,
    ));
  }
  Future<dynamic> getproducts() async {

    // Give your sever URL of get_employees_details.php file
    var url = 'https://www.hookupke.com/mobile/posts.php';

    final response = await http.get(Uri.parse(url));
    List<dynamic> map = json.decode(response.body);
    List<Product> products =
    await map.map<Product>((json) => Product.fromJson(json)).toList();
    allproducts.value = products;
    print(products);
    return products;
  }

/*  Future<List<Product>> fetchProducts() async {

    try {
      Response response =
      await dio.get("https://harambeeapps.co.ke/fashiola/products.php");
      //  print(response.toString());
      // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
      final jsonData = jsonDecode(response.data);
      List<dynamic> values = <dynamic>[];
      values = json.decode(response.data);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<dynamic, dynamic> map = values[i];
            products.add(Product.fromJson(map));
            debugPrint('Id-------${map['id']}');
          }
        }
      }
      return products;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }*/
}
