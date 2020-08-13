import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/home/home_list_item.dart';
import 'package:dailyaww/features/home/home_list_viewmodel.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeListWidget extends StatefulWidget {
  @override
  _HomeListWidgetState createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget> {
  @override
  void initState() {
    Provider.of<HomeListViewModel>(context, listen: false).setRefresh(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeListViewModel>(
      builder: (context, viewModel, child) {
        return appScaffold(list(viewModel),
            hideAppBar: true,
            isLoading: viewModel.isRefresh(),
            bottomNavigationBar: viewModel.setBottomNavigation());
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
        var heightResized = (previewHeight * widthResizeRatio) + 60;

        if (heightResized > previewWidth) {
          heightResized = previewWidth;
        }

        return new ConstrainedBox(
            constraints: new BoxConstraints(
              minWidth: screenWidth,
              minHeight: heightResized,
              maxHeight: heightResized,
            ),
            child: HomeListItem(
              content: item,
            ));
      },
    );

    return listview;
  }
}
