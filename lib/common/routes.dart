import 'package:dailyaww/features/detail/detail_viewmodel.dart';
import 'package:dailyaww/features/detail/detail.dart';
import 'package:dailyaww/features/home/home.dart';
import 'package:dailyaww/features/settings/settings.dart';
import 'package:flutter/material.dart';

class Routes {
  static const Home = "/";
  static const Detail = "/detail";

  static void toHome(context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeWidget(),
        settings: RouteSettings(name: 'HomeList')));
  }

  static void toHomeList(context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeWidget(),
        settings: RouteSettings(name: 'HomeList')));
  }

  static toDetail(context, contentModel) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailWidget(contentModel: contentModel),
            settings: RouteSettings(name: 'DetailView')));
  }

  static void toSettings(context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Settings(),
        settings: RouteSettings(name: 'Settings')));
  }

  static void pop(context) {
    Navigator.pop(context);
  }
}
