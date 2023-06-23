import 'package:edu_lens/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class CustomLoginBezierCurve extends StatelessWidget {
  late double screenWidth;

  CustomLoginBezierCurve(this.screenWidth, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ProsteBezierCurve(
            position: ClipPosition.bottom,
            list: [
              BezierCurveSection(
                start: const Offset(0, 125),
                top: Offset(screenWidth / 4, 190),
                end: Offset(screenWidth / 2, 165),
              ),
              BezierCurveSection(
                start: Offset(screenWidth / 2, 165),
                top: Offset(screenWidth / 4 * 3, 120),
                end: Offset(screenWidth, 160),
              ),
            ],
          ),
          child: Container(
            height: 200,
            color: AppConstants.lightPrimaryColor,
          ),
        ),
        ClipPath(
          clipper: ProsteBezierCurve(
            position: ClipPosition.bottom,
            list: [
              BezierCurveSection(
                start: const Offset(0, 125),
                top: Offset(screenWidth / 4, 150),
                end: Offset(screenWidth / 2, 125),
              ),
              BezierCurveSection(
                start: Offset(screenWidth / 2, 125),
                top: Offset(screenWidth / 4 * 3, 100),
                end: Offset(screenWidth, 150),
              ),
            ],
          ),
          child: Container(
            height: 150,
            color:AppConstants.primaryColor,
          ),
        ),

      ],
    );
  }
}
