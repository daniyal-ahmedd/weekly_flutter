import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'sports_activity.dart';

class SQliteHelper {
  static Database? db;
  final String colDate = "date";
  final String colId = "id";
  final String colDescription = "description";
  final String tableName = "sports";

  Future init() async {
    Directory appDocsDir = await getApplicationDocumentsDirectory();
    String path = "${appDocsDir.path}/sports.db";
    db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        "create table $tableName ($colId integer primarykey, $colDescription text, $colDate text);");
  }

  Future<int> existingCounter() async {
    // select max(id) from sports;

    int max_count = Sqflite.firstIntValue(
            await db!.rawQuery("select max($colId) from $tableName")) ??
        1;
    return max_count;
  }

  Future<List<SportsActiviy>> getAllData() async {
    List<SportsActiviy> allGamesData = [];

    List<Map<String, dynamic>> allResults =
        await db!.query(tableName, orderBy: colDate);
    for (var result in allResults) {
      allGamesData.add(SportsActiviy.fromJsonMap(result));
    }
    return allGamesData;
  }

  Future removeSportsEntry(String key) async {
    await db!.rawDelete("delete from $tableName where $colId = $key;");
    //await db!.delete(tableName, where: "$colId=?", whereArgs: [key]);
  }

  // cout << "\"Hello";
  Future saveSportsActivity(SportsActiviy activiy) async {
    // insert into sports (id, description, date) values (1, "abc", "2024-04-29")
    /*await db!.rawInsert(
        "insert into $tableName ($colId, $colDescription, $colDate) values (${activiy.id}, \"${activiy.description}\", \"${activiy.date}\" );");*/

    await db!.insert(tableName, activiy.toJsonMap());
  }
}
