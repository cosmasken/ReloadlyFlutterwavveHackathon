import 'package:flutter/material.dart';
import 'package:swarp/components/texts/blacktext.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, this.onPressed, required this.title, required this.child})
      : super(key: key);
  final Function()? onPressed;
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: Color.fromRGBO(252, 163, 17, 0.2),
              ),
              padding: EdgeInsets.all(15),
              child: child,
            ),
            BlackText(
              margin: EdgeInsets.only(top: 10),
              text: title,
              weight: FontWeight.normal,
            )
          ],
        ));
  }
}
