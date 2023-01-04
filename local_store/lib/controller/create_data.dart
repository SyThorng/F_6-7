// // import 'package:sqflite/sqlite_api.dart';

// // String table = 'user';

// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';

// class ConnectionDB {
//   Future<Database> initializeDB() async {
//     String path = await getDatabasesPath();
//     return openDatabase(
//       join(path, 'tododatabase.db'),
//       onCreate: (database, version) async {
//         await database.execute(
//           'CREATE TABLE $table(id INTEGER PRIMARY KEY, name TEXT, password TEXT,pic TEXT)',
//         );
//       },
//       version: 1,
//     );
//   }

// //   Future<void> insertUser(User user) async {
// //     final db = await initializeDB();
// //     await db.insert(table, user.tomap(),
// //         conflictAlgorithm: ConflictAlgorithm.replace);
// //     print('Function Insert');
// //   }