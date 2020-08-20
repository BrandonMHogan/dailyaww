import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/services/localizations_service.dart';
import 'package:flutter/material.dart';

BottomNavigationBar getHomeFooter(onBottomBarTap, {currentIndex = 0}) {
  const home = BottomNavigationBarItem(
      icon: Icon(Icons.home), title: Text(Localize.home));

  const refresh = BottomNavigationBarItem(
      icon: Icon(Icons.refresh), title: Text(Localize.refresh));

  const settings = BottomNavigationBarItem(
      icon: Icon(Icons.settings), title: Text(Localize.settings));

  const saved = BottomNavigationBarItem(
      icon: Icon(Icons.favorite), title: Text(Localize.saved));

  return setBottomBar(const <BottomNavigationBarItem>[
    home,
    saved,
    settings,
    refresh
  ], onBottomBarTap, currentIndex: currentIndex);
}
