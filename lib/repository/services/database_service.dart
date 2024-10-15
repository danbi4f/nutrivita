import 'package:nutrivita/repository/models/food/food_attribute.dart';
import 'package:nutrivita/repository/models/food/food_attribute_type.dart';
import 'package:nutrivita/repository/models/food/food_nutrient.dart';
import 'package:nutrivita/repository/models/food/food_portion.dart';
import 'package:nutrivita/repository/models/food/input_food.dart';
import 'package:nutrivita/repository/models/food/measure_unit.dart';
import 'package:nutrivita/repository/models/food/nutrient.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';
import 'package:nutrivita/repository/models/food/wweia_food_category.dart';
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

  Future<void> insertSurveyFood(SurveyFood surveyFood) async {
  final db = await database;
  await db.insert(
    'SurveyFood',
    surveyFood.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> insertFoodNutrient(FoodNutrient foodNutrient) async {
  final db = await database;
  await db.insert(
    'FoodNutrient',
    foodNutrient.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}


Future<void> insertNutrient(Nutrient nutrient) async {
  final db = await database;
  await db.insert(
    'Nutrient',
    nutrient.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> insertFoodAttribute(FoodAttribute foodAttribute) async {
  final db = await database;
  await db.insert(
    'FoodAttribute',
    foodAttribute.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}


Future<void> insertFoodAttributeType(FoodAttributeType foodAttributeType) async {
  final db = await database;
  await db.insert(
    'FoodAttributeType',
    foodAttributeType.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}


Future<void> insertInputFood(InputFood inputFood) async {
  final db = await database;
  await db.insert(
    'InputFood',
    inputFood.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> insertFoodPortion(FoodPortion foodPortion) async {
  final db = await database;
  await db.insert(
    'FoodPortion',
    foodPortion.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> insertMeasureUnit(MeasureUnit measureUnit) async {
  final db = await database;
  await db.insert(
    'MeasureUnit',
    measureUnit.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> insertWweiaFoodCategory(WweiaFoodCategory wweiaFoodCategory) async {
  final db = await database;
  await db.insert(
    'WweiaFoodCategory',
    wweiaFoodCategory.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<SurveyFood>> getAllSurveyFoods() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('SurveyFood');

  return List.generate(maps.length, (i) {
    return SurveyFood.fromJson(maps[i]);
  });
}




Future _createDB(Database db, int version) async {
  await db.execute('''CREATE TABLE SurveyFood (
    fdcId INTEGER PRIMARY KEY,
    description TEXT,
    foodClass TEXT,
    foodCode TEXT,
    startDate TEXT,
    endDate TEXT,
    publicationDate TEXT,
    dataType TEXT
  );''');
  // ----------------------------------------------------------------
  await db.execute('''CREATE TABLE FoodNutrient (
    id INTEGER PRIMARY KEY,
    foodId INTEGER,
    nutrientId INTEGER,
    amount REAL,
    type TEXT,
    FOREIGN KEY (foodId) REFERENCES SurveyFood (fdcId),
    FOREIGN KEY (nutrientId) REFERENCES Nutrient (id)
  );''');

  await db.execute('''CREATE TABLE Nutrient (
    id INTEGER PRIMARY KEY,
    number TEXT,
    name TEXT,
    rank INTEGER,
    unitName TEXT
  );''');
  // ----------------------------------------------------------------
  await db.execute('''CREATE TABLE FoodAttribute (
    id INTEGER PRIMARY KEY,
    foodId INTEGER,
    foodAttributeTypeId INTEGER,
    name TEXT,
    value TEXT,
    FOREIGN KEY (foodId) REFERENCES SurveyFood (fdcId),
    FOREIGN KEY (foodAttributeTypeId) REFERENCES FoodAttributeType (id)
  );''');

  await db.execute('''CREATE TABLE FoodAttributeType (
    id INTEGER PRIMARY KEY,
    name TEXT,
    description TEXT
  );''');
  // ----------------------------------------------------------------
  await db.execute('''CREATE TABLE InputFood (
    id INTEGER PRIMARY KEY,
    foodId INTEGER,
    unit TEXT,
    portionDescription TEXT,
    portionCode TEXT,
    foodDescription TEXT,
    sequenceNumber INTEGER,
    ingredientDescription TEXT,
    ingredientWeight INTEGER,
    amount INTEGER,
    ingredientCode INTEGER,
    FOREIGN KEY (foodId) REFERENCES SurveyFood (fdcId)
  );''');
  // ----------------------------------------------------------------
  await db.execute('''CREATE TABLE FoodPortion (
    id INTEGER PRIMARY KEY,
    foodId INTEGER,
    measureUnitId INTEGER,
    modifier TEXT,
    gramWeight REAL,
    sequenceNumber INTEGER,
    portionDescription TEXT,
    FOREIGN KEY (foodId) REFERENCES SurveyFood (fdcId),
    FOREIGN KEY (measureUnitId) REFERENCES MeasureUnit (id)
  );''');

  await db.execute('''CREATE TABLE MeasureUnit (
    id INTEGER PRIMARY KEY,
    name TEXT,
    abbreviation TEXT
  );''');
  // ----------------------------------------------------------------
  await db.execute('''CREATE TABLE WweiaFoodCategory (
    wweiaFoodCategoryCode INTEGER PRIMARY KEY,
    foodId INTEGER,
    wweiaFoodCategoryDescription TEXT,
    FOREIGN KEY (foodId) REFERENCES SurveyFood (fdcId)
  );''');
}

}
