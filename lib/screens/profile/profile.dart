import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/screens/profile/profiletab.dart';
import 'package:swarp/theme/colors.dart';

import '../logout.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<ProfileTabData> profiletabs = [
    ProfileTabData(title: 'History', icon: Icons.history),
    ProfileTabData(title: 'Giftcards', icon: Icons.bookmark),
    ProfileTabData(
        title: 'Airtime & Data', icon: Icons.mark_email_unread_outlined),
    ProfileTabData(
        title: 'Wallet', icon: Icons.account_balance_wallet_outlined),
    ProfileTabData(title: 'Logout', icon: Icons.person_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        backgroundColor: Colors.black12,
        flexibleSpace: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Positioned.fill(
                child: GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border:
                            Border.all(color: AppColors.secondary, width: 2)),
                    child: const CircleAvatar(
                      radius: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const BlackText(
                    text: "@Rolaayenyi",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.red,
                        size: 15,
                      ),
                      BlackText(
                        size: 16,
                        text: 'Ikorodu',
                        weight: FontWeight.normal,
                      )
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 60),
        child: Column(
          children: [ ProfileTab(
              title: 'History', icon: Icons.history
          ),
            ProfileTab(
                title: 'Giftcards', icon: Icons.bookmark
            ),
            ProfileTab(
                title: 'Airtime & Data', icon: Icons.mark_email_unread_outlined
            ),
            ProfileTab(
                title: 'Wallet', icon: Icons.account_balance_wallet_outlined
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>Logout());
              },
              child: ProfileTab(
                  title: 'Logout', icon: Icons.person_outline
              ),
            ),
          ]
        ),
      ),
    ));
  }
}

class ProfileTabData {
  final String title;
  final IconData icon;

  ProfileTabData({required this.title, required this.icon});
}
