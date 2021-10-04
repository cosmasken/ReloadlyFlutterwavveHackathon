import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AfterLogout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
        crossAxisAlignment: CrossAxisAlignment.center ,//Center Column contents horizontally,
        children: [
          const Text("You are now logged out",
            style: TextStyle(
              color: Colors.white,
                fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Center(
            child: SvgPicture.asset(
                'assets/svg/afterlogout.svg'
            ),
          ),
          SizedBox(height: 10,),
          const Text("You can go back home and continue trading",
            style: TextStyle( color: Colors.white,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          const Text("LOG IN",
            style: TextStyle( color: Color(0xfff08e1a),
                fontSize: 20,
                fontWeight: FontWeight.bold),),

        ],
      ),
    );
  }

}