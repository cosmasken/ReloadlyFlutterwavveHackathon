import 'package:flutter/material.dart';
import 'package:swarp/components/inputs/custominput.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/screens/community/invitecard.dart';
import 'package:swarp/theme/colors.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20, bottom: 70),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomInput(
                  prefixIcon: Icon(Icons.search),
                  controller: searchController,
                  hint: "Find a community"),
            ),
            Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlackText(text: 'Recommended'),
                        SizedBox(
                          height: 20,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () {},
                              child: const Text(
                                'See all',
                                style: TextStyle(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline),
                              )),
                        )
                      ],
                    ),
                    BlackText(
                      margin: EdgeInsets.only(top: 5, bottom: 20),
                      text: 'Communities related to fashion',
                      weight: FontWeight.normal,
                      size: 16,
                    ),
                  ],
                )),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/products/chair.png',
                          ),
                        ),
                        BlackText(
                          margin: EdgeInsets.only(top: 10),
                          text: 'Designers',
                          weight: FontWeight.w500,
                          size: 14,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/products/chair.png',
                          ),
                        ),
                        BlackText(
                          margin: EdgeInsets.only(top: 10),
                          text: 'Designers',
                          weight: FontWeight.w500,
                          size: 14,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BlackText(text: 'Invite people to your community'),
                        SizedBox(
                          height: 20,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () {},
                              child: const Text(
                                'See all',
                                style: TextStyle(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline),
                              )),
                        )
                      ],
                    ),
                    InviteCard(),
                    InviteCard(),
                    InviteCard(),
                    InviteCard(),
                    InviteCard(),
                    InviteCard()
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
