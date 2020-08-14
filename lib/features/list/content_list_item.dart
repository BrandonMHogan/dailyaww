import 'package:dailyaww/common/routes.dart';
import 'package:dailyaww/services/image_service.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:flutter/material.dart';

class ContentListItem extends StatefulWidget {
  @override
  _ContentListItemWidgetState createState() => _ContentListItemWidgetState();

  final ContentViewModel content;
  ContentListItem({this.content});
}

class _ContentListItemWidgetState extends State<ContentListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
              child: GestureDetector(
                  onTap: () {
                    Routes.toDetail(context, widget.content);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Hero(
                      tag: widget.content.id,
                      child: ImageService.cacheImage(widget.content.preview),
                    ),
                  ))),
        ],
      ),
    );
  }
}
