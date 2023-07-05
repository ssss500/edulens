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
          icon: const Icon(Icons.phone_rounded),
          iconSize: width * 0.02,
          onPressed: () {
            launchUrl(Uri(scheme: 'tel', path: "01092884278"));
          },
        ),
        SizedBox(
          width: width * 0.0015,
        ),
        InkWell(
          onTap: () async {
            // final Uri _url = Uri.parse(
            //     'whatsapp://send?phone=+201092884278');
            //
            // await launchUrl(_url);
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
          onTap: () async {
            final Uri url = Uri.parse('whatsapp://send?phone=+201092884278');
            await launchUrl(url);
          },
          child: Image.asset(
            "assets/images/whatsapp.png",
            height: height * 0.04,
            width: width * 0.04,
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
          onTap: () {},
        ),
        SizedBox(
          width: width * 0.009,
        ),
        IconButton(
          icon: const Icon(Icons.tiktok),
          iconSize: width * 0.02,
          onPressed: () {
            Clipboard.setData(const ClipboardData(text: "01092884278"))
                .then((_) {
            });
          },
        ),
      ],
    );
  }
}
