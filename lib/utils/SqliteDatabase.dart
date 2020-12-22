import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';
import 'package:pam_2020_msaver/models/OutcomeModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class SqliteDatabase {
  static Database _database;

  SqliteDatabase._();
  static final SqliteDatabase db = SqliteDatabase._();

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE categories ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "color INTEGER"
          ")");
      await db.execute("CREATE TABLE outcomes ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "value TEXT,"
          "category_id INTEGER,"
          "datetime DATETIME,"
          "FOREIGN KEY(category_id) REFERENCES categories(id)"
          ")");
    });
  }

  getCategory(int id) async {
    final db = await database;
    var res = await db.query("categories", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty
        ? CategoryModel(
            id: res.first['id'],
            name: res.first['name'],
            color: Color(res.first['color']))
        : Null;
  }

  deleteCategory(int id) async {
    final db = await database;
    db.delete("categories", where: "id = ?", whereArgs: [id]);
  }

  insertCategory(CategoryModel newClient) async {
    final db = await database;
    var res = await db.insert("categories", newClient.toMap());
    return res;
  }

  Future<List<CategoryModel>> getAllCategories() async {
    final db = await database;
    var res = await db.query("categories");
    List<CategoryModel> list = res.isNotEmpty
        ? res
            .map((c) => CategoryModel(
                color: Color(c['color']), id: c['id'], name: c['name']))
            .toList()
        : [];
    return list;
  }

  insertOutcome(OutcomeModel outcome) async {
    final db = await database;
    var res = await db.insert("outcomes", outcome.toMap());
    return res;
  }

  deleteCategoryOutcome(int id) async {
    final db = await database;
    db.delete("outcomes", where: "category_id = ?", whereArgs: [id]);
}


 Future getSumOutcome() async {
    var db = await database;
    var result = await db.rawQuery("SELECT SUM(value) as sum FROM outcomes");
    return result.toList();
}

Future getSumMonth() async {
    var db = await database;
    var result = await db.rawQuery("SELECT SUM(value) as sum FROM outcomes WHERE datetime >= date(2020-06-12)");
    return result.toList();
}

  Future<List<OutcomeModel>> getAllOutcomes() async {
    final db = await database;
    var res = await db.rawQuery(
        "SELECT outcomes.*, categories.name as c_name, categories.color as c_color, categories.id as c_id FROM outcomes LEFT JOIN categories ON outcomes.category_id = categories.id;");
    print(res);
    List<OutcomeModel> list = res.isNotEmpty
        ? res.map((c) {
            return OutcomeModel(
                value: double.parse(c['value']),
                id: c['id'],
                name: c['name'],
                dateTime: DateTime.parse(c['datetime']),
                category: CategoryModel(
                    color: Color(c['c_color']),
                    name: c['c_name'],
                    id: c['c_id']));
          }).toList()
        : [];
    return list;
  }
}
