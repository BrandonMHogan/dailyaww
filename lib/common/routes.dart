import 'package:dailyaww/features/detail/detail_viewmodel.dart';
import 'package:dailyaww/features/detail/detail.dart';
import 'package:dailyaww/features/home/home_list.dart';
import 'package:flutter/material.dart';

class Routes {
  static const Home = "/";
  static const Detail = "/detail";

  static void toHomeList(context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeListWidget(),
        settings: RouteSettings(name: 'HomeList')));
  }

  static void toDetail(context, content) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            DetailWidget(viewModel: DetailViewModel(content: content)),
        settings: RouteSettings(name: 'DetailView')));
  }

  static void pop(context) {
    Navigator.pop(context);
  }
}
