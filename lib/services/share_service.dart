import 'package:dailyaww/services/image_service.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

class ShareService {
  /// shares an image using native share functionality.
  /// will pull the image from the default cache stored in the image service.
  static void share(String title, String url, {String mimeType = 'image/jpg'}) {
    ImageService.getCacheManager().getSingleFile(url)?.then((fileInfo) {
      // converts the file to bytes and sends it off into the share service
      fileInfo.readAsBytes().then((bytes) {
        Share.file('The Daily Aww', title, bytes, mimeType,
            text: 'Shared From The Daily Aww app');
      });
    });
  }
}
