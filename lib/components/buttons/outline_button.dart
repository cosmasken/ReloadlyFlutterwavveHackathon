import 'package:swarp/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Alignment align;
  final Color backgroundColor;
  final double size;
  final Color color;
  final EdgeInsets padding;
  final bool indicator;

  const CustomOutlinedButton(
      {Key? key,
      this.onPressed,
      this.padding = const EdgeInsets.all(5),
      this.color = AppColors.secondary,
      this.size = 18,
      required this.text,
      this.align = Alignment.center,
      this.backgroundColor = Colors.transparent,
      this.indicator = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: padding,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            side: const BorderSide(color: AppColors.primary)),
        onPressed: onPressed,
        child: indicator
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColors.primary),
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                    fontSize: size,
                    color: color,
                    fontWeight: FontWeight.bold),
              ));
  }
}
