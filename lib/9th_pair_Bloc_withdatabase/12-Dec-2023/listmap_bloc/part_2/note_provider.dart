//
// import 'package:flutter/widgets.dart';
//
// import 'app_db.dart';
// import 'model/note_model.dart';
//
// class NoteProvider extends ChangeNotifier {
//   AppDataBase db;
//
//   NoteProvider({required this.db});
//
//   List<NoteModel> _arrNotes = [];
//   List<NoteModel> getNotes() => _arrNotes;
//
//   //events
//   void getAllNotes() async {
//     _arrNotes = await db.fetchNotes();
//     notifyListeners();
//   }
//
//   void addNote(NoteModel newNote) async {
//     await db.addNote(newNote);
//     _arrNotes = await db.fetchNotes();
//     notifyListeners();
//   }
//   //update notes
//
//
// //delete notes
// }
