import 'package:dailyaww/features/detail/detail_widget.dart';
import 'package:flutter/material.dart';

class Routes {
  static const Home = "/";
  static const Detail = "/detail";

  static void toDetail(context, content) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailWidget(content: content)));
  }

  static void pop(context) {
    Navigator.pop(context);
  }
}
