import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/home/home_viewmodel.dart';
import 'package:dailyaww/widget/content_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  // final _saved = Set<Content>();
  // Future<List<Content>> _listFuture;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(builder: (context, viewmodel, child) {
          return ContentList();
        }));
  }

  // Future<void> refreshList() async {
  //   refreshKey.currentState?.show(atTop: false);
  //   setState(() {
  //     _listFuture = vm.refreshAndGetList();
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   final vm = Provider.of<HomeViewModel>(context);

  //   return ChangeNotifierProvider(
  //     create: (context) => HomeViewModel(),
  //     child: appScaffold(getFutureBuilder(context)),
  //   );
  // }

  // // creates the list view item
  // Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
  //   List<Content> values = snapshot.data;
  //   print(values[0].preview);
  //   print(values[1].preview);
  //   return new ListView.builder(
  //     itemCount: values.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       final alreadySaved = _saved.contains(values[index]);

  //       // should cache the image into the cached network
  //       CachedNetworkImage(
  //         imageUrl: values[index].preview,
  //         progressIndicatorBuilder: (context, url, downloadProgress) =>
  //             CircularProgressIndicator(value: downloadProgress.progress),
  //         errorWidget: (context, url, error) => Icon(Icons.error),
  //       );

  //       return new Column(
  //         children: <Widget>[
  //           new ListTile(
  //             title: new Text(values[index].title),
  //             trailing: Icon(
  //               // NEW from here...
  //               alreadySaved ? Icons.favorite : Icons.favorite_border,
  //               color: alreadySaved ? Colors.red : null,
  //             ),
  //             onTap: () {
  //               // NEW lines from here...
  //               setState(() {
  //                 if (alreadySaved) {
  //                   _saved.remove(values[index]);
  //                 } else {
  //                   _saved.add(values[index]);
  //                 }
  //               });
  //             },
  //           ),
  //           new ConstrainedBox(
  //             constraints: new BoxConstraints(
  //               minHeight: 350, //MediaQuery.of(context).size.width,
  //               maxHeight: 350, //MediaQuery.of(context).size.width,
  //             ),
  //             child: new Image(
  //                 alignment: Alignment.topCenter,
  //                 image: CachedNetworkImageProvider(values[index].preview)),
  //           ),
  //           //new Image.network(values[index].data.preview.images[0].source.url),
  //           new Divider(
  //             height: 6.0,
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // Widget getFutureBuilder(BuildContext context) {
  //   return new FutureBuilder(
  //     future: _listFuture,
  //     builder: (BuildContext context, AsyncSnapshot<List<Content>> snapshot) {
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.none:
  //         case ConnectionState.waiting:
  //           return new Center(
  //             child: new CircularProgressIndicator(),
  //           );
  //         case ConnectionState.done:
  //           if (snapshot.hasError) return new Text('Error: ${snapshot.error}');

  //           return new RefreshIndicator(
  //             child: createListView(context, snapshot),
  //             key: refreshKey,
  //             color: Colors.blue,
  //             onRefresh: refreshList,
  //           );
  //           break;
  //         default:
  //           return null;
  //       }
  //     },
  //   );
  // }
}
