import 'package:flutter/material.dart';
import 'package:swarp/util/colors.dart';


class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          color: CustomColor.themeColor,
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}
