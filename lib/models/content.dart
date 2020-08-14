final String tableContent = 'content';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnPreview = 'preview';
final String columnPreviewWidth = 'previewWidth';
final String columnPreviewHeight = 'previewHeight';
final String columnIsVideo = 'isVideo';
final String columnIsGif = 'isGif';
final String columnCreated = 'created';
final String columnVideoUrl = 'videoUrl';
final String columnVideoWidth = 'videoWidth';
final String columnVideoHeight = 'videoHeight';

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
  bool isGif;
  DateTime created;
  String videoUrl;
  int videoWidth;
  int videoHeight;

  Content(id, title, preview, int previewWidth, int previewHeight, int created,
      {isVideo = false,
      isGif = false,
      videoUrl,
      int videoWidth,
      int videoHeight}) {
    this.id = id;
    this.title = title;
    this.preview = preview;
    this.previewWidth = previewWidth;
    this.previewHeight = previewHeight;
    this.isVideo = isVideo;
    this.isGif = isGif;
    this.videoUrl = videoUrl;
    this.videoWidth = videoWidth;
    this.videoHeight = videoHeight;

    // converts the created timestamp to a DateTime property
    this.created = new DateTime.fromMillisecondsSinceEpoch(created * 1000);
  }

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnTitle: title,
      columnPreview: preview,
      columnPreviewWidth: previewWidth,
      columnPreviewHeight: previewHeight,
      columnIsVideo: isVideo == true ? 1 : 0,
      columnIsGif: isGif == true ? 1 : 0,
      columnCreated: created.millisecondsSinceEpoch,
      columnVideoUrl: videoUrl,
      columnVideoWidth: videoWidth,
      columnVideoHeight: videoHeight
    };
  }

  Content.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    preview = map[columnPreview];
    previewWidth = map[columnPreviewWidth];
    previewHeight = map[columnPreviewHeight];
    isVideo = map[columnIsVideo] == 1;
    isGif = map[columnIsGif] == 1;
    created = new DateTime.fromMillisecondsSinceEpoch(map[columnCreated]);
    videoUrl = map[columnVideoUrl];
    videoWidth = map[columnVideoWidth];
    videoHeight = map[columnVideoHeight];
  }
}
