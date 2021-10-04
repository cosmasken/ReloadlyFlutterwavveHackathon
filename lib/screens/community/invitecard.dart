import 'package:flutter/material.dart';
import 'package:swarp/components/buttons/primary_button.dart';
import 'package:swarp/components/texts/blacktext.dart';

class InviteCard extends StatelessWidget {
  const InviteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Color.fromRGBO(252, 163, 20, 0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 27,
                ),
                BlackText(
                  text: '@BolaFeyi',
                  margin: EdgeInsets.only(left: 10),
                )
              ],
            ),
          ),
          Expanded(
              flex: 5,
              child: PrimaryButton(
                elevation: 0,
                buttonText: 'See Profile',
              ))
        ],
      ),
    );
  }
}
