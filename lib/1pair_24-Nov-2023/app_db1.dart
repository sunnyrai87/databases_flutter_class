// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// class AppDataBase {
//   //AppDataBase.mDB(
//   //private constructor below (Singleton)
//   AppDataBase._();
//   static final AppDataBase instance = AppDataBase._();
//   Database? myDB;
//
//   Future<Database> initDB() async {
//     var docDirectory = await getApplicationDocumentsDirectory();
//     var dbPath = join(docDirectory.path, "notesDb.db");
//
//     return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
//       //create all your tables here
//       db.execute(
//           "Create table notes ( noteID integer primary key autoincrement, title text, desc text)");
//     });
//   }
//
//   Future<Database> getDB() async {
//     if (myDB != null) {
//       return myDB!;
//     } else {
//       myDB = await initDB();
//       return myDB!;
//     }
//   }
//
//   void addNote(String mtitle, String mdesc) async {
//     var db = await getDB();
//     db.insert("notes", {
//       "title": mtitle,
//       "desc": mdesc,
//     });
//   }
// }