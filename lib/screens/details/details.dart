import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swarp/components/buttons/outline_button.dart';
import 'package:swarp/components/buttons/primary_button.dart';
import 'package:swarp/components/buttons/secondary_button.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/controller/flutterwave_controller.dart';
import 'package:swarp/screens/delivery/delivery.dart';
import 'package:swarp/theme/colors.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<String> images = [
    'assets/products/chair.png',
    'assets/products/chair_2.png',
  ];
  int _current = 0;
  final FlutterwaveController stateController = Get.put(FlutterwaveController());
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {},
        ),
        title: const BlackText(text: 'Category:Interior'),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Similar Items',
                style: TextStyle(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.black12,
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                          viewportFraction: 1,
                          // aspectRatio: 1,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          // enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                      items: images.map((e) {
                        return Image.asset(
                          e,
                          scale: 0.7,
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: images
                          .map((e) => Opacity(
                              opacity: _current == images.indexOf(e) ? 1 : 0.5,
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: AppColors.secondary,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x4cd20000),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                              )))
                          .toList(),
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BlackText(
                                text: '@TOLUwhyte',
                                margin: EdgeInsets.zero,
                              ),
                              SizedBox(
                                height: 20,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero),
                                    onPressed: () {},
                                    child: const Text(
                                      'Similar Items',
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          decoration: TextDecoration.underline),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.bookmark),
                        color: AppColors.primary,
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 25),
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.secondary,
                                fontWeight: FontWeight.bold),
                            text: 'Item name:',
                            children: [
                          TextSpan(
                              text: 'West Stool',
                              style: TextStyle(fontWeight: FontWeight.normal))
                        ])),
                  ),
                  const BlackText(
                    text: 'Product Description:',
                    weight: FontWeight.w500,
                    size: 16,
                    margin: EdgeInsets.only(bottom: 5),
                  ),
                  const BlackText(
                    text:
                        "The west stool was gotten 2 years back in Dubai, it is still in very good shape. I'm relocating that is why i am swapping it off.",
                    weight: FontWeight.normal,
                    size: 14,
                    color: Colors.black38,
                    margin: EdgeInsets.only(bottom: 40),
                  ),
                  Row(
                    children: const [
                      BlackText(
                        text: 'Location:',
                        margin: EdgeInsets.zero,
                        weight: FontWeight.normal,
                        size: 16,
                      ),
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.red,
                        size: 15,
                      ),
                      BlackText(
                        size: 16,
                        text: 'Ikorodu',
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.07,
                        bottom: 20),
                    width: double.infinity,
                    child: PrimaryButton(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      elevation: 0,
                      buttonText: 'Buy Now',
                      onPressed: () {
                        stateController.beginPayment(context);
                      //  Get.to(()=>Delivery());
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomOutlinedButton(
                      text: 'Chat',
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
