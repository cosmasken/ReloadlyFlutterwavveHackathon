import 'package:flutter/material.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/theme/colors.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab(
      {Key? key, this.onPressed, required this.title, required this.icon})
      : super(key: key);
  final Function()? onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 35),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.primary20,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    icon,
                    size: 30,
                    color: AppColors.primary,
                  ),
                ),
                BlackText(
                  text: title,
                  margin: EdgeInsets.only(left: 15),
                )
              ],
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
