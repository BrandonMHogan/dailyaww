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
        },
      )
    ]);
  }

  Widget list(content) {
    return ListView.builder(
      itemCount: content.length,
      itemBuilder: (context, index) {
        if (content == null) {
          return Text("No items found");
        }

        final item = content[index];

        return new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: 250.0,
          ),
          child: Card(
            elevation: 2.5,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(item.title),
                ),
                new Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    fit: BoxFit.fitWidth,
                    imageUrl: item.preview,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
