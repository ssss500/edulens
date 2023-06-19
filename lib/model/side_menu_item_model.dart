import 'package:flutter/material.dart';

class SideMenuItemModel {
  final String? title;
  final IconData? icon;
  final String? routeScreen;
  final Widget? screen;

  SideMenuItemModel({this.title, this.icon, this.routeScreen, this.screen});

  factory SideMenuItemModel.fromJson(Map<String, dynamic> json) {
    return SideMenuItemModel(
      title: json['title'],
      icon: json['icon'] != null ? IconData(json['icon']) : null,
      routeScreen: json['routeScreen'],
      screen: json['screen'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icon': icon != null ? icon!.codePoint : null,
      'routeScreen': routeScreen,
      'screen': screen,
    };
  }
}
