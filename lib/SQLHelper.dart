import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:write_it_down/constants/dbConstants.dart';

/// HELPER CLASS FOR SQLITE OPERATIONS
class SQLHelper {
  /// CREATE DATABASE
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      dbName,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  /// CREATE TABLE
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE $tableNotes(
        $fieldNoteID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        $fieldNoteTitle TEXT,
        $fieldNoteBody TEXT,
        $fieldNoteCreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
  }

  /// FETCH ALL NOTES
  static Future<List<Map<String, dynamic>>> getAllNotes() async {
    final db = await SQLHelper.db();
    return db.query(tableNotes, orderBy: fieldNoteCreatedAt);
  }

  /// FETCH A SINGLE NOTE BY ID
  static Future<List<Map<String, dynamic>>> getNoteByID(int id) async {
    final db = await SQLHelper.db();
    return db.query(tableNotes, where: "$fieldNoteID = ?", whereArgs: [id], limit: 1);
  }

  /// CREATE NEW NOTE
  static Future<int> createNote(String noteTitle, String? noteBody) async {
    final db = await SQLHelper.db();

    final data = {
      fieldNoteTitle: noteTitle,
      fieldNoteBody: noteBody,
    };
    final id = await db.insert(
      tableNotes,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  /// UPDATE NOTE BY ID
  static Future<int> updateNote(
      int id, String noteTitle, String? noteBody) async {
    final db = await SQLHelper.db();

    final data = {
      fieldNoteTitle: noteTitle,
      fieldNoteBody: noteBody,
      fieldNoteCreatedAt: DateTime.now().toString()
    };

    final result =
        await db.update(tableNotes, data, where: "$fieldNoteID = ?", whereArgs: [id]);
    return result;
  }

  /// DELETE SINGLE NOTE BY ID
  static Future<void> deleteNoteByID(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete(tableNotes, where: "$fieldNoteID = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
