import 'package:dailyaww/models/content.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static getDatabase() async {
    return openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), 'aww_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE content(id STRING PRIMARY KEY, title TEXT, preview TEXT, previewWidth INTEGER, previewHeight INTEGER, isVideo INTEGER, isGif INTEGER, created INTEGER, videoUrl TEXT, videoWidth INTEGER, videoHeight INTEGER)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  static Future<void> insertContent(Content content) async {
    // Get a reference to the database.
    final Database db = await getDatabase();

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'content',
      content.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// A method that retrieves all the content from the content table.
  static Future<List<Content>> getContent() async {
    // Get a reference to the database.
    final Database db = await getDatabase();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('content');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Content.fromMap(maps[i]);
    });
  }

  static Future<Content> getContentById(String id) async {
    // Get a reference to the database.
    final Database db = await getDatabase();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query(
      'content', where: "id = ?",
      // Pass the content's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
      limit: 1,
    );

    if (maps.isEmpty) return null;

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Content.fromMap(maps[i]);
    }).first;
  }

  static Future<void> updateContent(Content content) async {
    // Get a reference to the database.
    final db = await getDatabase();

    // Update the given Dog.
    await db.update(
      'content',
      content.toMap(),
      // Ensure that the content has a matching id.
      where: "id = ?",
      // Pass the content's id as a whereArg to prevent SQL injection.
      whereArgs: [content.id],
    );
  }

  static Future<void> deleteContent(String id) async {
    // Get a reference to the database.
    final db = await getDatabase();

    // Remove the Dog from the Database.
    await db.delete(
      'content',
      // Use a `where` clause to delete a specific content.
      where: "id = ?",
      // Pass the content's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
