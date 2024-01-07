// import 'package:databases_flutter_class/5_pair_29-Nov-2023/user_Model.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sqflite/sqflite.dart';
//
// import '../models/expense_model.dart';
// import '../user_model/user_model.dart';
//
// ///
//
// class AppDataBase {
//   //AppDataBase.mDB(
//   //private constructor below (Singleton)
//   AppDataBase._();
//   static final AppDataBase instance = AppDataBase._();
//   Database? myDB;
//
//   //login prefs key
//   static final String LOGIN_UID = "uid";
//
//   // table
//   static final String EXP_TABLE = "expense";
//   static final String USER_TABLE = "users";
//
//   //user columns
//   static final String COLUMN_USER_ID = "uId";
//   static final String COLUMN_USER_NAME = "uName";
//   static final String COLUMN_USER_EMAIL = "uEmail";
//   static final String COLUMN_USER_PASS = "uPass";
//
//   //expense columns
//   //add uId here also
//
//   static final String COLUMN_EXPENSE_ID = "expID";
//   static final String COLUMN_EXPENSE_TITLE = "expTitle";
//   static final String COLUMN_EXPENSE_DESC = "expDesc";
//   static final String COLUMN_EXPENSE_TIMESTAMP = "expTimeStamp";
//   static final String COLUMN_EXPENSE_AMT = "expAmt";
//   static final String COLUMN_EXPENSE_BALANCE = "expBal";
//   static final String COLUMN_EXPENSE_TYPE = "expType"; //0 for debit and 1 for credit
//   static final String COLUMN_EXPENSE_CAT_TYPE = "expCatType";
//
//   Future<Database> initDB() async {
//     var docDirectory = await getApplicationDocumentsDirectory();
//     var dbPath = join(docDirectory.path, "expenso.db");
//
//     return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
//       //create all your tables here
//
//       ///user
//       db.execute(
//           "Create table $USER_TABLE ( $COLUMN_USER_ID integer primary key autoincrement, $COLUMN_USER_NAME text, $COLUMN_USER_EMAIL text,$COLUMN_USER_PASS text )");
//
//       /// expense
//       db.execute(
//           "Create table $EXP_TABLE ( $COLUMN_EXPENSE_ID integer primary key autoincrement, $COLUMN_USER_ID integar, $COLUMN_EXPENSE_TITLE text, $COLUMN_EXPENSE_DESC text, $COLUMN_EXPENSE_TIMESTAMP text, $COLUMN_EXPENSE_AMT real, $COLUMN_EXPENSE_BALANCE real, $COLUMN_EXPENSE_TYPE integar, $COLUMN_EXPENSE_CAT_TYPE integar )");
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
//   // Future<bool> addNote(NoteModel newNote) async {
//   //   var db = await getDB();
//   //   var uid = await getUID();
//   //   newNote.user_id = uid;
//   //
//   //   var rowEffected= await db.insert(NOTE_TABLE, newNote.toMap());
//   //   return rowEffected >0;
//   // }
//
// Future<int> getUID() async{
//   var prefs = await SharedPreferences.getInstance();
//   var uid = prefs.getInt(AppDataBase.LOGIN_UID);
//   return uid ?? 0;
//
// }
//   // Future<List<NoteModel>> fetchNotes() async {
//   //   var uid = await getUID();
//   //
//   //   var db = await getDB();
//   //   List<NoteModel> arrNotes = [];
//   //   var data = await db
//   //       .query(NOTE_TABLE, where: "$COLUMN_USER_ID=?", whereArgs: ["$uid"]);
//   //
//   //   for (Map<String, dynamic> eachNote in data) {
//   //     var noteModel = NoteModel.fromMap(eachNote);
//   //     arrNotes.add(noteModel);
//   //   }
//   //   return arrNotes;
//   // }
//
//   // void updateNote(NoteModel updatedNote) async {
//   //   var db = await getDB();
//   //   //db.update(NOTE_TABLE, updatedNote.toMap(),where: "$COLUMN_NOTE_ID = ${updatedNote.note_id}", whereArgs: null);
//   //   db.update(NOTE_TABLE, updatedNote.toMap(),
//   //       where: "$COLUMN_NOTE_ID = ?", whereArgs: ['${updatedNote.note_id}']);
//   // }
//   //
//   // Future<bool> deleteNote(int id) async {
//   //   var db = await getDB();
//   //   var rowsEffected = await db.delete(NOTE_TABLE, where: "$COLUMN_NOTE_ID= $id");
//   //  return rowsEffected>0;
//   // }
//
//
//   ///queries for user
//   Future<bool> createAccount(UserModel newUser) async {
//     var check = await checkIfUserAlreadyExists(newUser.user_email);
//     if (!check) {
//       //create user
//       var db = await getDB();
//       db.insert(USER_TABLE, newUser.toMAP());
//       return true;
//     } else {
//       //do not create account
//       return false;
//     }
//   }
//
//   Future<bool> checkIfUserAlreadyExists(String email) async {
//     var db = await getDB();
//     var data = await db.query(USER_TABLE,
//         where: "$COLUMN_USER_EMAIL = ? ", whereArgs: [email]);
//     return data.isNotEmpty;
//     // if (data.isNotEmpty){
//     //   return true;
//     // } else { return false;}
//   }
//
//   Future<bool> authenticateUser(String email, String pass) async {
//     var db = await getDB();
//     var data = await db.query(USER_TABLE,
//         where: "$COLUMN_USER_EMAIL = ? and $COLUMN_USER_PASS= ?",
//         whereArgs: [email, pass]);
//
//     if (data.isNotEmpty) {
//       var prefs = await SharedPreferences.getInstance();
//       prefs.setInt(LOGIN_UID, UserModel.fromMap(data[0]).user_id);
//     }
//     return data.isNotEmpty;
//   }
//
//   /// expense
// Future <bool> addExpense(ExpenseModel newExpense)async{
//     var db = await getDB();
//    int rowsEffected = await db.insert(EXP_TABLE, newExpense.toMap());
//    return rowsEffected>0;
// }
//
//   Future<List<ExpenseModel>> fetchAllExpense()async{
//     var db = await getDB();
//     var data = await db.query(EXP_TABLE, orderBy: "$COLUMN_EXPENSE_TIMESTAMP DESC");
//     List<ExpenseModel> listExp =[];
//     for (Map<String, dynamic> eachExp in data ){
//       listExp.add(ExpenseModel.fromMap(eachExp));
//     };
//     return listExp;
//   }
// }
