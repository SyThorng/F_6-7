import 'package:note_database/contant/fild.dart';
import 'package:note_database/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'dart:developer' as dev;

class Dbhelper {
  Future<Database> initDataBase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      // .        nameDatabase
      join(path, 'Userdatabase.db'),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE $futblname($futitle TEXT,$fuper TEXT,$funote TEXT,$futime TEXT,$fucolor TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<List<User>> getUser() async {
    final db = await initDataBase();
    final List<Map<String, dynamic>> queryResult = await db.query(futblname);
    return queryResult.map((e) => User.fromJson(e)).toList();
  }

  Future<void> insertUser(User user) async {
    final db = await initDataBase();
    await db.insert(futblname, user.toJson());
    dev.log('Insert success');
  }

  Future<void> delete(String userTitile) async {
    final db = await initDataBase();
    await db.delete(futblname, where: "$futitle=?", whereArgs: [userTitile]);

    dev.log('Delete Success');
  }

  Future<void> updateUser(User user) async {
    final db = await initDataBase();
    await db.update(
      futblname,
      user.toJson(),
      where: '$futitle=?',
      whereArgs: [user.utitle],
    );
    dev.log('Update Success');
  }
}
