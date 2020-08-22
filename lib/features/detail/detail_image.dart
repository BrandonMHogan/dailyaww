import 'package:dailyaww/services/image_service.dart';
import 'package:flutter/widgets.dart';

Widget detailImage(contentModel) {
  return Hero(
    tag: contentModel.content.id,
    child: ImageService.cacheImage(contentModel.content.preview),
  );
}
