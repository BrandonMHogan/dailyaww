import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/home/home_viewmodel.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentList extends StatefulWidget {
  @override
  _ContentListWidgetState createState() => _ContentListWidgetState();

  final List<ContentViewModel> content;
  ContentList({this.content});
}

class _ContentListWidgetState extends State<ContentList> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).fetchReddit();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context);

    return appScaffold(list(viewModel.content), actions: <Widget>[
      // action button
      IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          viewModel.refresh();
          // scrolls back to the top of the list view and awaits the new data
          _scrollController.animateTo(0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        },
      )
    ]);
  }

  Widget list(content) {
    // loads the pixel ration and screen width for image resizing
    var pixRatio = MediaQuery.of(context).devicePixelRatio;
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      controller: _scrollController,
      itemCount: content.length,
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
          child: Card(
            elevation: 2.5,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  title: Text(item.title),
                  trailing: Icon(Icons.favorite),
                ),
                new Flexible(
                  child: CachedNetworkImage(
                    imageUrl: item.preview,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(3.0))
              ],
            ),
          ),
        );
      },
    );
  }
}
