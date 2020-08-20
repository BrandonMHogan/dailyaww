import 'package:dailyaww/common/list_item.dart';
import 'package:dailyaww/shared/content_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Builds the list view displayed in the build function
Widget list(context, scrollController, content) {
  // loads the pixel ration and screen width for image resizing
  var pixRatio = MediaQuery.of(context).devicePixelRatio;
  final screenWidth = MediaQuery.of(context).size.width;

  Widget listview = ListView.builder(
    controller: scrollController,
    itemCount: content.length,
    //key: ObjectKey(content[0]),
    itemBuilder: (context, index) {
      if (content == null) {
        return Text("No items found");
      }

      ContentModel item = content[index];

      // getting screen sizes
      final previewWidth = item.previewWidth / pixRatio;
      final previewHeight = item.previewHeight / pixRatio;
      final widthResizeRatio = screenWidth / previewWidth;
      var heightResized = (previewHeight * widthResizeRatio) - 2;

      if (heightResized > previewWidth) {
        heightResized = previewWidth;
      }

      return new ConstrainedBox(
          constraints: new BoxConstraints(
            minWidth: screenWidth,
            minHeight: heightResized,
            maxHeight: heightResized,
          ),
          child: listItem(context, item));
    },
  );

  return listview;
}
