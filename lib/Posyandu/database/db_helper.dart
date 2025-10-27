import 'package:belajar_ppkd/Posyandu/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DbHelper {
 static const tableUser = 'users';
 static Future<Database> db() async {
   final dbPath = await getDatabasesPath();
   return openDatabase(
     join(dbPath, 'posyandu.db'),
      version: 3,
     onCreate: (db, version) {
       return db.execute(
         'CREATE TABLE $tableUser(id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT,)',
       );
     },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            'ALTER TABLE $tableUser ADD COLUMN domisili TEXT',
          );
        }
        if (oldVersion < 3) {
          await db.execute(
            'ALTER TABLE $tableUser ADD COLUMN nomorhp TEXT',
          );
        }
      },
   );
 } 
 
 static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.insert(
      tableUser,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    //query adalah fungsi untuk menampilkan data (READ)
    final List<Map<String, dynamic>> results = await dbs.query(
      tableUser,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }
  // //MENAMBAHKAN SISWA
  // static Future<void> createStudent(UserModel user) async {
  //   final dbs = await db();
  //   //Insert adalah fungsi untuk menambahkan data (CREATE)
  //   await dbs.insert(
  //     tableUser,
  //     user.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  //   print(user.toMap());
  // }

   static Future<List<UserModel>> getALLUser() async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(tableUser);
    print(results.map((e) => UserModel.fromMap(e)).toList());
    return results.map((e) => UserModel.fromMap(e)).toList();
  }
}