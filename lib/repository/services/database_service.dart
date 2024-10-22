import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._constructor();

  static Database? _db;

  static final DatabaseService instance = DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final dir = await getDatabasesPath();
    final databasePath = join(dir, "master_db.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _createDB,
    );
    return database;
  }

  Future<void> insertSurveyFoodId(int fdcId) async {
    final db = await database;
    await db.insert(
      'SurveyFood',
      {'fdcId': fdcId},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<int>> getAllSurveyFoodIds() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('SurveyFood');

    return List.generate(maps.length, (i) {
      return maps[i]['fdcId'] as int;
    });
  }

    Future<void> removeSurveyFoodId(int fdcId) async {
    final db = await database;
    await db.delete(
      'SurveyFood',
      where: 'fdcId = ?',
      whereArgs: [fdcId],
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE SurveyFood (
    fdcId INTEGER PRIMARY KEY

  );''');
  }
}
