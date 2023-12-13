import 'package:databases_flutter_class/Provider/Consumer/9th_pair_05-Dec-2023/app_db.dart';
import 'package:databases_flutter_class/Provider/Consumer/9th_pair_05-Dec-2023/model/note_model.dart';
import 'package:flutter/widgets.dart';

class NoteProvider extends ChangeNotifier {
  AppDataBase db;

  NoteProvider({required this.db});

  List<NoteModel> _arrNotes = [];
  List<NoteModel> getNotes() => _arrNotes;

  //events
  void getAllNotes() async {
    _arrNotes = await db.fetchNotes();
    notifyListeners();
  }

  void addNote(NoteModel newNote) async {
    await db.addNote(newNote);
    _arrNotes = await db.fetchNotes();
    notifyListeners();
  }
  //update notes


//delete notes
}
