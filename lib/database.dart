import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'entity/friend.dart';

class DBHelper {
    var _db;

    Future<Database> get database async {
        if (_db != null) return _db;
        _db = openDatabase(join(await getDatabasesPath(), 'Friend.db'),
            onCreate: (db, version) => _createDb(db), version: 1);
        return _db;
    }

    static void _createDb(Database db) {
        db.execute(
            "CREATE TABLE Friend(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
    }

    Future<void> insertFriend(Friend friend) async {
        final db = await database;

        await db.insert("Friend", friend.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
    }

    Future<List<Friend>> getAllFriend() async {
        final db = await database;

        final List<Map<String, dynamic>> maps = await db.query('Friend');

        return List.generate(maps.length, (i) {
            return Friend(
                id: maps[i]['id'],
                name: maps[i]['name'],
            );
        });
    }

    Future<dynamic> getFriend(int id) async {
        final db = await database;

        final List<Map<String, dynamic>> maps = (await db.query(
            'Friend',
            where: 'id = ?',
            whereArgs: [id],
        ));

        return maps.isNotEmpty ? maps : null;
    }

    Future<void> updateFriend(Friend Friend) async {
        final db = await database;

        await db.update(
            "Friend",
            Friend.toMap(),
            where: "id = ?",
            whereArgs: [Friend.id],
        );
    }

    Future<void> deleteFriend(int id) async {
        final db = await database;

        await db.delete(
            "Friend",
            where: "id = ?",
            whereArgs: [id],
        );
    }
}

