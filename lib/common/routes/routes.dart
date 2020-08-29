import 'package:dailyaww/common/transitions/fade_route.dart';
import 'package:dailyaww/features/detail/detail.dart';
import 'package:dailyaww/features/home/home.dart';
import 'package:dailyaww/features/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const Home = "/";
  static const Detail = "/detail";

  static void toHome(context) {
    Navigator.push(context, FadeRoute(page: HomeWidget()));
  }

  static void toHomeList(context) {
    Navigator.push(context, FadeRoute(page: HomeWidget()));
  }

  static toDetail(context, contentModel) {
    Navigator.push(
        context, FadeRoute(page: DetailWidget(contentModel: contentModel)));
  }

  static void toSettings(self, context) {
    Navigator.push(context, FadeRoute(page: Settings()));
  }

  static void pop(context) {
    Navigator.pop(context);
  }
}
