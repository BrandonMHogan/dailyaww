import 'package:dailyaww/services/image_service.dart';
import 'package:dailyaww/services/localizations_service.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

/// Isolated class to handle sharing content
class ShareService {
  static const imageMimeType = 'image/jpg';
  static const mp4MimeType = 'video/mp4';

  /// shares an image using native share functionality.
  /// will pull the image from the default cache stored in the image service.
  static void share(String title, String url,
      {String mimeType = imageMimeType, bool isVideo = false}) {
    ImageService.getCacheManager().getSingleFile(url)?.then((fileInfo) {
      // converts the file to bytes and sends it off into the share service
      fileInfo.readAsBytes().then((bytes) {
        Share.file(
            Localize.appName, title, bytes, isVideo ? mp4MimeType : mimeType,
            text: Localize.shareMsg);
      });
    });
  }
}
