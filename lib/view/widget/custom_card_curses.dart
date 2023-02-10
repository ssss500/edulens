import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCardCurses extends StatelessWidget {
  CustomCardCurses(
      {super.key, this.height, this.width, this.image, this.title});

  final double? height;

  final double? width;

  final String? image;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: [
            CustomImageUrlViewNotZoom(
              image: image!,
              fit: BoxFit.fill,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.only(
                      left: 6, right: 6, bottom: 3, top: 3),
                  child: CustomText(
                    text: title!,
                    color: Colors.white,
                  ),
                )),
          ],
        ));
  }
}
