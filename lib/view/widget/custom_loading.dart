import 'package:edu_lens/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoading extends StatelessWidget {
  final bool boolUploading;
  final double doubleUploadTask;
  final String? textLoading;

  const CustomLoading(
      {super.key, this.boolUploading = false,
      this.doubleUploadTask = 0.0,
      this.textLoading});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppConstants.primaryColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(33.0))),
      content: SizedBox(
        height: 90,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppConstants.lightPrimaryColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                textLoading ?? "loading".tr,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
