import 'package:flutter/material.dart';
import 'package:swarp/components/texts/blacktext.dart';

class Product extends StatelessWidget {
  const Product(
      {Key? key,
      required this.image,
      required this.title,
      required this.location,
      this.onPressed})
      : super(key: key);
  final String image;
  final String title;
  final String location;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 5),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  image,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        title
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.red,
                        size: 15,
                      ),
                      Text(
                        "Location",
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
