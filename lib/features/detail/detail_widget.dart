import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {
  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  void _onBottomBarTap(int index) {
    setState(() {
      if (index == 2) Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ContentViewModel content = ModalRoute.of(context).settings.arguments;

    return appScaffold(
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Hero(
              tag: content.id,
              child: CachedNetworkImage(
                imageUrl: content.preview,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        hideAppBar: true,
        bottomNavigationBar: setBottomBar(const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.share), title: Text("Share")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), title: Text("Save")),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back), title: Text("Back")),
        ], _onBottomBarTap, currentIndex: 2));
  }
}
