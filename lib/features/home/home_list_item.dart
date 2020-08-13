import 'package:dailyaww/common/routes.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/services/image_service.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeListItem extends StatefulWidget {
  @override
  _HomeListItemWidgetState createState() => _HomeListItemWidgetState();

  final ContentViewModel content;
  HomeListItem({this.content});
}

class _HomeListItemWidgetState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              widget.content.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            //subtitle: Text(item.isVideo ? "is video" : ""),
            trailing: Icon(
              Icons.favorite_border,
              color: appTheme.accent,
            ),
          ),
          new Flexible(
              child: GestureDetector(
            onTap: () {
              Routes.toDetail(context, widget.content);
            },
            child: Hero(
              tag: widget.content.id,
              child: ImageService.cacheImage(widget.content.preview),
            ),
          )),
          Padding(padding: const EdgeInsets.all(3.5))
        ],
      ),
    );
  }
}
