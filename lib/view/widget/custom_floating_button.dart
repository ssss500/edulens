// import 'package:animations/animations.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:flutter/material.dart';


class CustomFloatingButton extends StatelessWidget {
// final  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
final  page;
final IconData icon;
final Function function;
final double sizeIcon;


CustomFloatingButton(
      {   this.page, this.icon=Icons.add, required this.function,this.sizeIcon=30});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: () =>function(),
      tooltip: 'Add Code',
      backgroundColor: AppConstants.primaryColor,
      child: Icon(icon,size: sizeIcon,),
    );
    //     :OpenContainer(
    //   transitionType: _transitionType,
    //   openBuilder: ( context, VoidCallback _) {
    //       function();
    //     return page;
    //
    //   },
    //   closedElevation: 6.0,
    //   closedShape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(fabDimension / 2),
    //     ),
    //   ),
    //   closedColor: AppConstants.primaryColor,
    //   closedBuilder: (BuildContext context, VoidCallback openContainer) {
    //     return SizedBox(
    //       height: fabDimension,
    //       width: fabDimension,
    //       child: Center(
    //         child: Icon(
    //           icon,
    //           size: sizeIcon,
    //           color: Colors.white,
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
