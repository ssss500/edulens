import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconsWindows extends StatelessWidget {
  const SocialMediaIconsWindows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.facebook,
            color: Colors.blue,
          ),
          iconSize: width * 0.02,
          onPressed: () async {
            final Uri url = Uri.parse('https://www.facebook.com/EdulensEgy');

            await launchUrl(url);
          },
        ),
        SizedBox(
          width: width * 0.0016,
        ),
        InkWell(
          onTap: () async {
            final Uri url = Uri.parse('https://www.edu-lens.com/');

            await launchUrl(url);
            // https://www.edu-lens.com/
          },
          child: Image.asset(
            "assets/images/logo-edu-lens.png",
            height: height * 0.035,
            width: width * 0.035,
          ),
        ),
        SizedBox(
          width: width * 0.009,
        ),
        InkWell(
          child: Image.asset(
            'assets/images/youtube2.png',
            width: width * 0.04,
            height: height * 0.04,
          ),
          onTap: () async {
            final Uri url = Uri.parse('https://www.youtube.com/@edulens1553');

            await launchUrl(url);
          },
        ),
        SizedBox(
          width: width * 0.009,
        ),
        IconButton(
          icon: const Icon(Icons.tiktok),
          iconSize: width * 0.02,
          onPressed: () async {
            //https://www.tiktok.com/@edulens.egy
            final Uri url = Uri.parse('https://www.tiktok.com/@edulens.egy');

            await launchUrl(url);
          },
        ),
      ],
    );
  }
}
