import 'package:dailyaww/models/content.dart';
import 'package:intl/intl.dart';

class ContentViewModel {
  final Content content;

  ContentViewModel({this.content});

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
}
