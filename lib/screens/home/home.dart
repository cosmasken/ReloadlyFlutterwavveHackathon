import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swarp/components/inputs/custominput.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/components/category_item.dart';
import 'package:swarp/components/product_card.dart';
import 'package:swarp/controller/flutterwave_controller.dart';
import 'package:swarp/controller/products_controller.dart';
import 'package:swarp/controller/state_controller.dart';
import 'package:swarp/screens/details/details.dart';
import 'package:swarp/theme/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchEditingController = TextEditingController();
  ProductsController productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BlackText(
              text: 'Welcome Rola',
              margin: EdgeInsets.zero,
            ),
            BlackText(
              margin: EdgeInsets.zero,
              text: 'What would you like to exhange?',
              color: Colors.black38,
              weight: FontWeight.normal,
              size: 16,
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: AppColors.primary,
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15,right: 15,bottom: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInput(
              margin: const EdgeInsets.only(top: 20, bottom: 40),
              controller: searchEditingController,
              hint: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
            const BlackText(
              text: 'Category',
              size: 22,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryItem(
                    child: Icon(Icons.person),
                    title: 'Clothes',
                  ),
                  CategoryItem(
                    child: Icon(Icons.person),
                    title: 'Clothes',
                  ),
                  CategoryItem(
                    child: Icon(Icons.person),
                    title: 'Clothes',
                  ),
                  CategoryItem(
                    child: Icon(Icons.person),
                    title: 'Clothes',
                  ),
                  CategoryItem(
                    child: Icon(Icons.person),
                    title: 'Clothes',
                  ),
                  CategoryItem(
                    child: Icon(Icons.person),
                    title: 'Clothes',
                  )
                ],
              ),
            ),
            const BlackText(
              margin: EdgeInsets.only(top: 40),
              text: 'New Deals',
              size: 22,
            ),

            GridView.count(
              padding: EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 25,
              crossAxisSpacing: 20,
              physics: NeverScrollableScrollPhysics(),
              children:  [
                GestureDetector(
                  onTap: (){
                    Get.to(()=>Details());
                  },
                  child: const Product(
                    title: "West Stool",
                    location: 'Ikoyi',
                    image: 'assets/products/chair.png',
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>Details());
                  },
                  child: Product(
                    title: "West Stool",
                    location: 'Ikoyi',
                    image: 'assets/products/chair.png',
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>Details());
                  },
                  child: Product(
                    title: "West Stool",
                    location: 'Ikoyi',
                    image: 'assets/products/chair.png',
                  ),
                ), GestureDetector(
                  onTap: (){
                    Get.to(()=>Details());
                  },
                  child: Product(
                    title: "West Stool",
                    location: 'Ikoyi',
                    image: 'assets/products/chair.png',
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>Details());
                  },
                  child: Product(
                    title: "West Stool",
                    location: 'Ikoyi',
                    image: 'assets/products/chair.png',
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>Details());
                  },
                  child: Product(
                    title: "West Stool",
                    location: 'Ikoyi',
                    image: 'assets/products/chair.png',
                  ),
                ),

              ],
            )
          ],
        ),
      )),
    );

  }
}
