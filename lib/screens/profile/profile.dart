import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/controller/reloadly_controller.dart';
import 'package:swarp/screens/after_logout.dart';
import 'package:swarp/screens/profile/profiletab.dart';
import 'package:swarp/theme/colors.dart';
import 'package:swarp/util/dimensions.dart';

import '../logout.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}
final  reloadlyController = Get.put(ReloadlyController());
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
  void initState() {
    super.initState();
    reloadlyController.getBalance();
  }
  final _auth = FirebaseAuth.instance;
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
          children: [

            reloadlybalance(context),
            ProfileTab(
              title: 'History', icon: Icons.history
          ),
            GestureDetector(
              onTap: (){
                reloadlyController.getCountries();
              },
              child: ProfileTab(
                  title: 'Giftcards', icon: Icons.bookmark
              ),
            ),
            ProfileTab(
                title: 'Airtime & Data', icon: Icons.mark_email_unread_outlined
            ),
            ProfileTab(
                title: 'Wallet', icon: Icons.account_balance_wallet_outlined
            ),
            GestureDetector(
              onTap: (){
                _auth.signOut();
                Get.to(()=>AfterLogout());
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
 reloadlybalance(BuildContext context) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: const EdgeInsets.only(top: 15, right: 15),
    padding: const EdgeInsets.all(15),
    height: screenAwareSize(90, context),
    width: _media.width / 2 - 25,
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.blue.withOpacity(0.4),
              blurRadius: 16,
              spreadRadius: 0.2,
              offset: const Offset(0, 8)),
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  <Widget>[
        Text(
          "Reloadly Balance",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
   Obx(() => Text(reloadlyController.balance.value,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),



      ],
    ),
  );
}

class ProfileTabData {
  final String title;
  final IconData icon;

  ProfileTabData({required this.title, required this.icon});
}
