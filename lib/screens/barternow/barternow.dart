import 'package:flutter/material.dart';
import 'package:swarp/components/buttons/outline_button.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/theme/colors.dart';

class BarterNow extends StatefulWidget {
  const BarterNow({Key? key}) : super(key: key);

  @override
  _BarterNowState createState() => _BarterNowState();
}

class _BarterNowState extends State<BarterNow> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.13,
        backgroundColor: Colors.black12,
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_left),
                ),
                const BlackText(text: 'Barter Now'),
              ],
            ),
            const BlackText(
              margin: EdgeInsets.only(top: 0, left: 50),
              text: "Here's how it works",
              color: Colors.black38,
              weight: FontWeight.normal,
              size: 16,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 40),
              child: RichText(
                  text: const TextSpan(
                      text: '01',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                      children: [
                    TextSpan(
                        text: 'Choose items you want to barter',
                        style: TextStyle(
                            color: AppColors.secondary,
                            fontSize: 16,
                            fontStyle: FontStyle.normal))
                  ])),
            ),
            const BlackText(text: 'Items for Exchange:'),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 15),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Image.asset(
                    'lib/assets/products/chair.png',
                    colorBlendMode: BlendMode.color,
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BlackText(
                        text: 'West Stool',
                        color: Colors.white,
                        weight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                                size: 16,
                                weight: FontWeight.normal,
                                color: Colors.white,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                  BlackText(
                                    color: Colors.white,
                                    size: 16,
                                    text: 'Ikorodu',
                                    weight: FontWeight.normal,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Image.asset(
                    'lib/assets/products/chair.png',
                    colorBlendMode: BlendMode.color,
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BlackText(
                        text: 'Rest Pillow',
                        color: Colors.white,
                        weight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                                text: 'You',
                                size: 16,
                                weight: FontWeight.normal,
                                color: Colors.white,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                  BlackText(
                                    color: Colors.white,
                                    size: 16,
                                    text: 'Ikeja',
                                    weight: FontWeight.normal,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 40),
              child: RichText(
                  text: const TextSpan(
                      text: '02 ',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                      children: [
                    TextSpan(
                        text: 'Choose your best delivery method',
                        style: TextStyle(
                            color: AppColors.secondary,
                            fontSize: 16,
                            fontStyle: FontStyle.normal))
                  ])),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: CustomOutlinedButton(
                      text: 'Delivery',
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      onPressed: () {},
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 7,
                    child: CustomOutlinedButton(
                      text: 'Pickup',
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
