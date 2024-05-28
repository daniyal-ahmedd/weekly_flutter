import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'sportsactivity.dart';

class SQliteHelper {
  static Database? db;
  final String colId = "id";
  final String colDate = "date";
  final String colGameDetail = "gameDetail";
  final String tableName = "sports";

  Future init() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    String dirPath = appDocumentsDir.path;
    String dbPath = dirPath + "/sports.db";

    db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "create table $tableName ($colId integer primary key, $colDate text, $colGameDetail text);");
      },
    );
  }

  Future<int> getExistingCounter() async {
    return Sqflite.firstIntValue(
            await db!.rawQuery("select max($colId) from $tableName;")) ??
        1;
  }

  // insert into sports (id, date, gameDetail) values (1, "2024-05-02", "CS vs Math")
  Future saveSportsRecord(SportsActivity activity) async {
    await db!.rawInsert(
        "insert into $tableName ($colId, $colDate, $colGameDetail) values (${activity.id}, \"${activity.date}\", \"${activity.gameDetail}\")");

    // await db!.insert(tableName, activity.toMap());
  }

  Future removeSportsRecord(String id) async {
    await db!.rawDelete("delete from $tableName where $colId=$id;");
    // await db!.delete(tableName, where: "$colId=?", whereArgs: [id]);
  }

  Future<List<SportsActivity>> getAllGamesData() async {
    List<SportsActivity> listGames = [];

    // List<Map<String, dynamic>> allRows =
    //     await db!.rawQuery("select * from $tableName");

    List<Map<String, dynamic>> allRows = await db!.query(tableName);

    for (var row in allRows) {
      listGames.add(SportsActivity.fromMap(row));
    }
    return listGames;
  }
}
