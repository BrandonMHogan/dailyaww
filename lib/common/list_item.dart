import 'package:dailyaww/common/routes.dart';
import 'package:dailyaww/services/image_service.dart';
import 'package:flutter/material.dart';

/// The list item widget used to display the content
/// on both the fresh and saved lists
Widget listItem(context, content) {
  return Card(
    child: Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
            child: GestureDetector(
                onTap: () {
                  Routes.toDetail(context, content);
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Hero(
                    tag: content.id,
                    child: ImageService.cacheImage(content.preview),
                  ),
                ))),
      ],
    ),
  );
}
