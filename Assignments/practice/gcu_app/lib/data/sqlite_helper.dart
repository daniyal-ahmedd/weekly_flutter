import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'sports_entry.dart';

class SQLite_helper {
  static Database? db;
  String Id = "id";
  String description = "description";
  String Date = "date";
  String tableName = "sports";

  Future init () async {
    final Directory appDir = await getApplicationDocumentsDirectory(); 
    String appDocsPath = appDir.path;
    String dbPath = "$appDocsPath/sports.db";

    db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "create table $tableName ($Id integer primarykey, $description text, $Date text);  "
        );
        
      },
    );
  }

    Future writeSportsEntry(sports_entry entry) async {
      // await spref.setString(entry.id.toString(), entry.toJson());
      // int existingCounter = spref.getInt("counter") ?? 1;
      // await spref.setInt("counter", existingCounter + 1);
      await db!.insert(tableName, entry.toMap());
      }

    Future removeSportsEntry(String id) async {
    //  await spref.remove(id);
    await db!.delete(tableName, where: "$Id=?", whereArgs: [id]);
    // await db!.rawQuery("DELETE ROW FROM $tableName where $Id=$id");
    }

    Future<int> getExistingCounter() async {
      return Sqflite.firstIntValue(
        await db!.rawQuery("select max($Id) from $tableName;")
      ) ?? 1;
    }

    Future<List<sports_entry>> getAllSportsData() async {
    List<sports_entry> list_sports_entries = [];

    // var keys = spref.getKeys();

    // keys.forEach((element) {
    //   if( element != "counter")
    //   {
    //     var jsonString = spref.getString(element);
    //     sports_entry entry = sports_entry.fromJson(jsonString ?? "");
    //     list_sports_entries.add(entry);
    //     }
    // });

    List<Map <String, dynamic>> listAllData = await db!.query(tableName);
    for (var row in listAllData) {
      list_sports_entries.add(sports_entry.fromMap(row));
    }

    return list_sports_entries;
  }
    
  }