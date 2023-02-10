import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';


  showCustomSnackBar({context,title,deck,ContentType? contentType}){
 var snackBar= SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: "$title",
      message:
     "$deck",

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: contentType!,

      inMaterialBanner: true,
    ),
  );
 return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}


