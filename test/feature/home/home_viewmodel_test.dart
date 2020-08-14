// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dailyaww/features/list/content_list_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Adding new item to content list', () {
    final viewModel = HomeListViewModel();

    viewModel.addListener(() {
      expect(viewModel.content.length, greaterThanOrEqualTo(1),
          reason: "Make sure content can be incremented");
    });

    // viewModel.add(new ContentViewModel());
  });
}
