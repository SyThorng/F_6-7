import 'package:local_database/constant/database_field.dart';
import 'package:local_database/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'dart:developer' as dev;

class ConnectDB {
  Future<Database> initDataBase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      // .        nameDatabase
      join(path, 'Userdatabase.db'),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE $tblName($fuId INTEGER PRIMARY KEY, $fuName TEXT,$fuAge INTEGER,$fuImage TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(User user) async {
    final db = await initDataBase();
    await db.insert(tblName!, user.toJson());

    dev.log('Insert success');
  }

  Future<List<User>> getUser() async {
    final db = await initDataBase();
    final List<Map<String, dynamic>> queryResult = await db.query(tblName!);
    return queryResult.map((e) => User.FromJson(e)).toList();
    //queryResult.map((e) => todo.fromMap(e)).toList();
  }

  Future<void> delete(int userID) async {
    final db = await initDataBase();
    await db.delete(tblName!, where: "$fuAge=?", whereArgs: [userID]);

    dev.log('Delete Success');
  }

  Future<void> updateUser(User user) async {
    final db = await initDataBase();
    await db.update(
      tblName!,
      user.toJson(),
      where: '$fuId=?',
      whereArgs: [user.uid],
    );
  }
}
