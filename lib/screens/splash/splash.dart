import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swarp/screens/onboarding/onboarding.dart';
import 'package:swarp/theme/colors.dart';

import '../homepage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),(){
     Get.to(()=>Onboarding());
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
