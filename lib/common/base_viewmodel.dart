import 'dart:async';
import 'package:flutter/material.dart';

/// All view models must extends this base model.
/// Handles backstack popping and other shared functionality.
class BaseViewModel extends ChangeNotifier {
  // holds the value to determine if the stack should be popped
  bool _popBackStack = false;
  // stream controller handles the streaming of popBackStack
  final _popBackStackController = StreamController<bool>();
  // public facing stream that can be listened to for popBackStack
  Stream<bool> get popBackstack => _popBackStackController.stream;

  // pulbic facing function to set if the stack should be popped or not
  void setPopBackstack(value) {
    _popBackStack = value;
    _popBackStackController.add(_popBackStack);
  }

  /// Required to close any stream controller that has been opened
  void dispose() {
    super.dispose();
    _popBackStackController.close();
  }
}
