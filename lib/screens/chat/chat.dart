import 'package:flutter/material.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/theme/colors.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/chat.png'),
            BlackText(text: 'No Conversation Yet!'),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2),
              child: BlackText(
                  textAlign: TextAlign.center,
                  weight: FontWeight.normal,
                  text:
                      "Looking a little lonely here, reach out and talk swap with someone"),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 30,
              child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {},
                  child: const Text(
                    'Start a Chat',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.primary,
                        decoration: TextDecoration.underline),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
