import 'package:swarp/theme/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final double elevation;
  final bool indicator;
  final EdgeInsets padding;

  const PrimaryButton(
      {Key? key,
      this.onPressed,
      this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      this.buttonText = '',
      this.elevation = 10,
      this.indicator = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          padding: MaterialStateProperty.resolveWith((states) {
            return padding;
          }),
          elevation: MaterialStateProperty.resolveWith(
              (states) => onPressed == null ? 0 : elevation),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return AppColors.primary;
          })),
      onPressed: onPressed,
      child: indicator
          ? const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 2,
              ),
            )
          : Text(buttonText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
    );
  }
}
