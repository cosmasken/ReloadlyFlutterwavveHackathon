import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swarp/components/buttons/secondary_button.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/screens/login/login.dart';
import 'package:swarp/theme/colors.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<OnboardingItems> onboarding = [
    OnboardingItems(
        image: 'assets/onboarding/onboarding_1.png',
        title: 'Find Items To Swap, From Your Comfort Zone',
        description: 'Anywhere, anyday and anytime.'),
    OnboardingItems(
        image: 'assets/onboarding/onboarding_2.png',
        title: 'Join Your Swap Community, Based On Preference',
        description: 'Connect with like-minded people.'),
    OnboardingItems(
        image: 'assets/onboarding/onboarding_3.png',
        title: 'Get Items To you Easily, At Your Doorstep',
        description: "Pick-up or delivery, we've got you.")
  ];
  int _current = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                    viewportFraction: 1,
                    aspectRatio: 0.8,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    // enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: onboarding.map((e) {
                  return Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        e.image,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.9),
                        child: Column(
                          children: [
                            BlackText(
                              text: e.title,
                              size: 22,
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SecondaryButton(
                      text: _current == 2 ? "   " : 'Skip',
                      onPressed: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: onboarding
                          .map((e) => Opacity(
                              opacity:
                                  _current == onboarding.indexOf(e) ? 1 : 0.5,
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
                    SecondaryButton(
                      text: _current == 2 ? "Get Started" : 'Next',
                      onPressed: () {
                        if (_current == 2) {
                          // authController.user != null ? Get.to(()=>const Login()) : Get.to(()=>const Login());
                          Get.to(()=>const Login());
                        } else {
                          carouselController.nextPage();
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnboardingItems {
  String image;
  String title;
  String description;

  OnboardingItems(
      {required this.image, required this.title, required this.description});
}
