
import 'package:flutter_bloc/flutter_bloc.dart';

import '../13th_pair_09-Dec-2023/app_db.dart';
import '../13th_pair_09-Dec-2023/model/note_model.dart';
import 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  AppDataBase appDb;
  NoteCubit({required this.appDb}) : super(InitialState());

  /// events
  /// addnotes

  void addNote(NoteModel newNote) async {
    emit(LoadingState());
    var check = await appDb.addNote(newNote);
    if (check) {
      List<NoteModel> arrNotes = await appDb.fetchNotes();
      emit(LoadedState(mNotes: arrNotes));
    } else {
      emit(ErrorState(
        errMsg: "Note not added!!",
      ));
    }
  }

  void getAllNotes() async {
    emit(LoadingState());
    List<NoteModel> arrNotes = await appDb.fetchNotes();
    emit(LoadedState(mNotes: arrNotes));
  }

  void deleteNote(int id) async {
    emit(LoadingState());
    var check =await appDb.deleteNote(id);
    if(check){List<NoteModel> arrNotes = await appDb.fetchNotes();
    emit(LoadedState(mNotes: arrNotes));
    }
    else {emit(ErrorState(
        errMsg: "Note not deleted!!"));}
  }
}
