import 'package:cached_network_image/cached_network_image.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageUrlView extends StatelessWidget {
  final image, colorLodingIcon;

  double? width, height;
  final fit;

  CustomImageUrlView(
      {super.key,
      required this.image,
      this.fit = BoxFit.cover,
      this.height = 100.0,
      this.colorLodingIcon = Colors.white,
      this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: fit,
      imageBuilder: (context, imageProvider) => InkWell(
        onTap: () {
          Get.toNamed(RoutesNames.zoomImageView,
              arguments: {
                'imageUrl': image,
              },
              preventDuplicates: false);
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
        color: colorLodingIcon,
      )),
      errorWidget: (context, url, error) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.broken_image_rounded),
          const SizedBox(
            height: 8,
          ),
          CustomText(
            text: "imageErrorMessage".tr,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

class CustomImageUrlViewNotZoom extends StatelessWidget {
  final image, colorLodingIcon, width, fit, height;

  const CustomImageUrlViewNotZoom(
      {super.key,
      required this.image,
      this.colorLodingIcon = Colors.white,
      this.width = double.infinity,
      this.fit = BoxFit.cover,
      this.height = 200.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        ),
        placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
          color: colorLodingIcon,
        )),
        errorWidget: (context, url, error) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.broken_image_rounded,
              size: 40,
            ),
            const SizedBox(
              height: 8,
            ),
            CustomText(
              text: "imageErrorMessage".tr,
            )
          ],
        ),
      ),
    );
  }
}

class ZoomImageView extends StatelessWidget {
  // final imageUrl;

  const ZoomImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // debugPrint(imageUrl);
    String imageUrl = Get.arguments['imageUrl'];
    return Scaffold(
      body: SafeArea(
        child: Hero(
          tag: 'imageZoom',
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ),
                FittedBox(
                  child: Image.network(
                    imageUrl,
                    height: MediaQuery.sizeOf(context).height / 1.2,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class CustomImageUrlHomeItem extends StatelessWidget {
//   final image, color, errorImage, height;
//
//   CustomImageUrlHomeItem(
//       {required this.image,
//         this.color=AppConstants.primaryColor,
//         this.errorImage="assets/images/logo.png",
//       this.height = 200.0});
//
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: image,
//       height: height,
// //fit: BoxFit.fitHeight,
//       imageBuilder: (context, imageProvider) =>
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                 image: imageProvider,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//       placeholder: (context, url) => Center(
//           child: CircularProgressIndicator(
//         color: color,
//       )),
//       errorWidget: (context, url, error) => ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//         child: Image.asset(
//           errorImage,
//           fit: BoxFit.cover,
//           height: height,
//           width: double.infinity,
//         ),
//       ),
//     );
//   }
// }
