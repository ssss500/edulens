import 'package:edu_lens/helper/app_constants.dart';
import 'package:flutter/material.dart';


class CustomFloatingButton extends StatelessWidget {
final  page;
final IconData icon;
final Function function;
final double sizeIcon;


const CustomFloatingButton(
      {super.key,    this.page, this.icon=Icons.add, required this.function,this.sizeIcon=30});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: () =>function(),
      tooltip: 'Add Code',
      backgroundColor: AppConstants.primaryColor,
      child: Icon(icon,size: sizeIcon,),
    );

  }
}
