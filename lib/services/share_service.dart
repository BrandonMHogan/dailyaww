import 'package:dailyaww/services/image_service.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

class ShareService {
  static void share(String title, String url, {String mimeType = 'image/jpg'}) {
    ImageService.getCacheManager().getFile(url).first?.then((fileInfo) {
      // converts the file to bytes and sends it off into the share service
      fileInfo.file.readAsBytes().then((bytes) {
        Share.file('The Daily Aww', title, bytes, mimeType,
            text: 'Shared From The Daily Aww app');
      });
    });
  }
}
