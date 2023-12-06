// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// import 'note_model.dart';
//
// class AppDataBase {
//   //AppDataBase.mDB(
//   //private constructor below (Singleton)
//   AppDataBase._();
//   static final AppDataBase instance = AppDataBase._();
//   Database? myDB;
// // table
//   static final String NOTE_TABLE = "notes";
//   static final String USER_TABLE = "users";
//
//   //user columns
//   static final String COLUMN_USER_ID = "uId";
//   static final String COLUMN_USER_NAME = "uName";
//   static final String COLUMN_USER_EMAIL = "uEmail";
//   static final String COLUMN_USER_PASS = "uPass";
//
//   //columns
//   //add uId here also
//   static final String COLUMN_NOTE_ID = "noteID";
//   static final String COLUMN_NOTE_TITLE = "title";
//   static final String COLUMN_NOTE_DESC = "desc";
//
//   Future<Database> initDB() async {
//     var docDirectory = await getApplicationDocumentsDirectory();
//     var dbPath = join(docDirectory.path, "notesDb.db");
//
//     return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
//       //create all your tables here
//
//       db.execute(
//           "Create table $USER_TABLE ( $COLUMN_USER_ID integer primary key autoincrement, $COLUMN_USER_NAME text, $COLUMN_USER_EMAIL text,$COLUMN_USER_PASS text, )");
//
//       db.execute(
//           "Create table $NOTE_TABLE ( $COLUMN_NOTE_ID integer primary key autoincrement, $COLUMN_NOTE_TITLE text, $COLUMN_NOTE_DESC text )");
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
//   void addNote(NoteModel newNote) async {
//     var db = await getDB();
//     db.insert(NOTE_TABLE, newNote.toMap());
//   }
//
//   Future<List<NoteModel>> fetchNotes() async {
//     var db = await getDB();
//     List<NoteModel> arrNotes = [];
//     var data = await db.query(NOTE_TABLE);
//
//     for (Map<String, dynamic> eachNote in data) {
//       var noteModel = NoteModel.fromMap(eachNote);
//       arrNotes.add(noteModel);
//     }
//     return arrNotes;
//   }
//
//   void updateNote(NoteModel updatedNote) async {
//     var db = await getDB();
//     //db.update(NOTE_TABLE, updatedNote.toMap(),where: "$COLUMN_NOTE_ID = ${updatedNote.note_id}", whereArgs: null);
//     db.update(NOTE_TABLE, updatedNote.toMap(),
//         where: "$COLUMN_NOTE_ID = ?", whereArgs: ['${updatedNote.note_id}']);
//   }
//
//   void deleteNotes(int id) async {
//     var db = await getDB();
//     db.delete(NOTE_TABLE, where: "$COLUMN_NOTE_ID= $id");
//   }
// }
