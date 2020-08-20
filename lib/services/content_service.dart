import 'package:dailyaww/data/content.dart';
import 'web_service.dart';
import 'database_service.dart';

/// Used to load the content, either from the web or from local database
class ContentService {
  /// public facing future that returns all content from all sources
  static Future<List<Content>> getContent({saved = false}) {
    if (saved) return DatabaseService.getContent();
    return WebService.getContent();
  }

  /// Will return the content if it is saved in the database, or
  /// null if its not
  static Future<Content> isSaved(String id) async {
    return DatabaseService.getContentById(id);
  }
}
