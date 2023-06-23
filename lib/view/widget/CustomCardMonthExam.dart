import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCardMonthExam extends StatelessWidget {
  const CustomCardMonthExam(
      {super.key,
      this.height,
      this.width,
      this.image,
      this.title,
      this.free,
      this.cost});

  final double? height;
  final double? width;
  final String? image;
  final String? title;
  final String? cost;
  final bool? free;

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
            if (!free!)
              Positioned(
                  // bottom: 50,
                  left: 5,
                  // right: 0,
                  top: 5,
                  child: Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.only(
                          left: 2, right: 2, bottom: 2, top: 2),
                      child: CustomText(
                        text: "${cost!}ج ",
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  )),
          ],
        ));
  }
}
