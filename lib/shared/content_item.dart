import 'package:dailyaww/data/content.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class ContentModel with ChangeNotifier {
  final Content content;

  ContentModel({this.content});

  notify() {
    notifyListeners();
  }

  String get id {
    return this.content.id;
  }

  String get title {
    return this.content.title;
  }

  String get preview {
    return this.content.preview;
  }

  int get previewHeight {
    return this.content.previewHeight;
  }

  int get previewWidth {
    return this.content.previewWidth;
  }

  DateTime get created {
    return this.content.created;
  }

  String get createdFormatted {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    return dateFormat.format(this.content.created);
  }

  bool get isVideo {
    return this.content.isVideo;
  }

  bool get isGif {
    return this.content.isGif;
  }

  String get videoUrl {
    return this.content.videoUrl;
  }

  int get videoWidth {
    return this.content.videoWidth;
  }

  int get videoHeight {
    return this.content.videoHeight;
  }
}
