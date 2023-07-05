import 'package:flutter/material.dart';

import '../../../responsive.dart';
import '../mobile/favourite_view.dart';
import '../mobile/home_menu_mobile.dart';
import '../windows/favourite.dart';

class FavouriteCommon extends StatelessWidget {
  const FavouriteCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: FavouriteMobile(), desktop:  FavouriteWindows());
  }
}
