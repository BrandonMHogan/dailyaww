import 'package:dailyaww/common/routes.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/list/content_list_viewmodel.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'content_list_item.dart';

class ContentListWidget extends StatefulWidget {
  @override
  _ContentListWidgetState createState() => _ContentListWidgetState();
}

class _ContentListWidgetState extends State<ContentListWidget> {
  @override
  void initState() {
    Provider.of<ContentListViewModel>(context, listen: false).setRefresh(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentListViewModel>(
      builder: (context, viewModel, child) {
        return list(viewModel);
      },
    );
  }

  /// Builds the list view displayed in the build function
  Widget list(viewModel) {
    var content = viewModel.content;
    // loads the pixel ration and screen width for image resizing
    var pixRatio = MediaQuery.of(context).devicePixelRatio;
    final screenWidth = MediaQuery.of(context).size.width;

    Widget listview = ListView.builder(
      controller: viewModel.getScrollController(),
      itemCount: content.length,
      //key: ObjectKey(content[0]),
      itemBuilder: (context, index) {
        if (content == null) {
          return Text("No items found");
        }

        final ContentViewModel item = content[index];

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
            child: ContentListItem(content: item));
      },
    );

    return listview;
  }
}
