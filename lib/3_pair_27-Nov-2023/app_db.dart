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
// // table
//   static final String NOTE_TABLE= "notes";
//   //columns
//   static final String COLUMN_NOTE_ID= "noteID";
//   static final String COLUMN_NOTE_TITLE= "title";
//   static final String COLUMN_NOTE_DESC= "desc";
//
//   Future<Database> initDB() async {
//     var docDirectory = await getApplicationDocumentsDirectory();
//     var dbPath = join(docDirectory.path, "notesDb.db");
//
//     return await openDatabase(dbPath,
//         version: 1,
//         onCreate: (db, version) {
//       //create all your tables here
//       db.execute(
//           "Create table $NOTE_TABLE ( $COLUMN_NOTE_ID integer primary key autoincrement, "
//               "$COLUMN_NOTE_TITLE text $COLUMN_NOTE_DESC text )");
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
//     db.insert(NOTE_TABLE, {
//       COLUMN_NOTE_TITLE: mtitle,
//       COLUMN_NOTE_DESC: mdesc,
//     });
//   }
//
//  Future <List<Map<String, dynamic>>>fetchNotes() async {
//     var db = await getDB();
//     var data = await db.query(NOTE_TABLE);
//      return data;
//   }
// }
