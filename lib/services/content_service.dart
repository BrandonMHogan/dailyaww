import 'package:dailyaww/models/content.dart';
import 'web_service.dart';
import 'database_service.dart';

/// Used to load the content, either from the web or from local database
class ContentService {
  /// public facing future that returns all content from all sources
  static Future<List<Content>> getContent({saved = false}) {
    if (saved) return DatabaseService.getContent();
    return WebService.getContent();
  }
}
