import 'package:cached_network_image/cached_network_image.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class CustomImageUrlView extends StatelessWidget {
  final image, colorLodingIcon, width;
final fit;
  CustomImageUrlView(
      {required this.image,
        this.fit=BoxFit.cover,
      this.colorLodingIcon = Colors.white,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => InkWell(
          onTap: () {
            Get.to(
                () => ZoomImageView(
                      imageUrl: image,
                    ),
                preventDuplicates: false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
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
            )
          ],
        ),
      ),
    );
  }
}

class CustomImageUrlViewNotZoom extends StatelessWidget {
  final image, colorLodingIcon, width, fit, height;

  CustomImageUrlViewNotZoom(
      {required this.image,
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
  final imageUrl;

  ZoomImageView({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // debugPrint(imageUrl);
    return Hero(
      tag: 'imageZoom',
      child: PhotoView(
        imageProvider: NetworkImage(imageUrl),
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
