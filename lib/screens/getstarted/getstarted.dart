import 'package:flutter/material.dart';
import 'package:swarp/components/buttons/outline_button.dart';
import 'package:swarp/components/buttons/primary_button.dart';
import 'package:swarp/components/buttons/secondary_button.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/theme/colors.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: AppColors.secondary,
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Positioned.fill(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.1,
                      horizontal: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5))
                      ]),
                  child: Column(
                    children: [
                      const BlackText(
                        text: 'Get Started?',
                        size: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.07,
                            bottom: 20),
                        width: double.infinity,
                        child: PrimaryButton(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          elevation: 0,
                          buttonText: 'Sign In',
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomOutlinedButton(
                          text: 'Sign Up',
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    transform: Matrix4.translationValues(
                        0, MediaQuery.of(context).size.height * 0.15, 0),
                    child: RichText(
                      text: const TextSpan(
                          text: 'Get Started means you must have read our ',
                          children: [
                            TextSpan(
                                text: 'terms & condition',
                                style: TextStyle(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline))
                          ],
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold)),
                    ))
              ],
            ),
          ))
        ],
      )),
    );
  }
}
