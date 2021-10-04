import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swarp/components/title_text.dart';

import 'after_logout.dart';

class Logout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
        crossAxisAlignment: CrossAxisAlignment.center ,//Center Column contents horizontally,
        children: [
          const Text("Are you sure you want to log out?",
            style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: Get.height*0.05,),
          Center(
            child: SvgPicture.asset(
                'assets/svg/logout.svg'
            ),
          ),
          SizedBox(height: Get.height*0.2,),
          logoutbutton(),
          SizedBox(height: 10,),
          staybutton(),
        ],
      ),
    );
  }
  Widget logoutbutton() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff08e1a)),
      ),
      child: GestureDetector(
        onTap: (){
          Get.to(()=>AfterLogout());
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 4),
          width: Get.width * .75,
          child: const TitleText(
            text: 'Proceed to logout',
            color: Color(0XFFFFFFFF),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
  Widget staybutton() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
          ),

        ),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffE1E2E4)),


      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4),
        width: Get.width * .75,
        child: const TitleText(
          text: 'No, Keep me in',
          color: Color(0xff20262C),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}