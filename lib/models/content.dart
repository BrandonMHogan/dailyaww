/// Main content object that is forwarded to the UI.
/// All data must conform to this object before leaving
/// the data layer
class Content {
  String id;
  String title;
  String preview;
  int previewWidth;
  int previewHeight;
  bool isVideo;
  DateTime created;

  Content(id, title, preview, int previewWidth, int previewHeight, int created,
      {isVideo = false}) {
    this.id = id;
    this.title = title;
    this.preview = preview;
    this.previewWidth = previewWidth;
    this.previewHeight = previewHeight;
    this.isVideo = isVideo;

    // converts the created timestamp to a DateTime property
    this.created = new DateTime.fromMillisecondsSinceEpoch(created * 1000);
  }
}
