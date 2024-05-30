import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'sports_entry.dart';

class SQliteHelper {
  static Database? db;
  final String colId = "id";
  final String colDescription = "description";
  final String colDate = "date";
  final String tableName = "sports";
  Future init() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    String appDocsPath = appDocumentsDir.path;
    String dbPath = "$appDocsPath/sports.db";

    // integer real text blob
    db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "create table $tableName ($colId integer primarykey, $colDescription text, $colDate text);");
      },
    );
  }

  // cout << "\"Hello!\""   // "Hello!"

  // insert into sports (id, description, date) values (1, "CS vs AI", "2024-05-07");
  Future writeSportsEntry(SportEntry entry) async {
    // await db!.rawInsert(
    //     "insert into $tableName ($colId, $colDate, $colDescription) values (${entry.id}, \"${entry.date}\", \"${entry.description}\")");

    await db!.insert(tableName, entry.toMap());
  }

  Future<int> getExisitingCounter() async {
    return Sqflite.firstIntValue(
            await db!.rawQuery("select max($colId) from $tableName;")) ??
        1;
  }

  Future removeExistingEntry(String id) async {
    // await db!.rawDelete("delete from $tableName where $colId=$id;");

    await db!.delete(tableName, where: "$colId=?", whereArgs: [id]);
  }

  Future<List<SportEntry>> getAllofSportsDate() async {
    List<SportEntry> listSportsEnties = [];

    // List<Map<String, dynamic>> listAllRows =
    //     await db!.rawQuery("select * from $tableName");
    List<Map<String, dynamic>> listAllRows = await db!.query(tableName);
    for (var row in listAllRows) {
      listSportsEnties.add(SportEntry.fromMap(row));
    }
    return listSportsEnties;
  }
}
