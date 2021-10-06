import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:swarp/util/app_constants.dart';
import 'package:swarp/util/colors.dart';

class FullPhotoPage extends StatelessWidget {
  final String url;

  FullPhotoPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.fullPhotoTitle,
          style: TextStyle(color: CustomColor.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(url),
        ),
      ),
    );
  }
}
