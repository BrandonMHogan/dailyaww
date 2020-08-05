import 'package:dailyaww/models/reddit/reddit_child_model.dart';
import 'package:dailyaww/services/content_loader.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<List<RedditChildModel>> _listFuture;

  @override
  void initState() {
    super.initState();
    _listFuture = refreshAndGetList();
  }

  ///Refreshes data from content loader and formats it back into a readable list of data
  Future<List<RedditChildModel>> refreshAndGetList() async {
    var values = new List<RedditChildModel>();

    ContentLoader loader = new ContentLoader();
    await loader.getRedditData().then((value) => values.addAll(value));

    return values;
  }

  Future<void> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    setState(() {
      _listFuture = refreshAndGetList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: _listFuture,
      builder: (BuildContext context,
          AsyncSnapshot<List<RedditChildModel>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Center(
              child: new CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');

            return new RefreshIndicator(
              child: createListView(context, snapshot),
              key: refreshKey,
              color: Colors.blue,
              onRefresh: refreshList,
            );
            break;
          default:
            return null;
        }
      },
    );

    // return Container(
    //   child: futureBuilder,
    // );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<RedditChildModel> values = snapshot.data;
    print(values[0].data.preview.images[0].source.url);
    print(values[1].data.preview.images[0].source.url);
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        // should cache the image into the cached network
        CachedNetworkImage(
          imageUrl: values[index].data.preview.images[0].source.url,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );

        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(values[index].data.title),
            ),
            new ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 350, //MediaQuery.of(context).size.width,
                maxHeight: 350, //MediaQuery.of(context).size.width,
              ),
              child: new Image(
                  alignment: Alignment.topCenter,
                  image: CachedNetworkImageProvider(
                      values[index].data.preview.images[0].source.url)),
            ),
            //new Image.network(values[index].data.preview.images[0].source.url),
            new Divider(
              height: 6.0,
            ),
          ],
        );
      },
    );
  }
}
