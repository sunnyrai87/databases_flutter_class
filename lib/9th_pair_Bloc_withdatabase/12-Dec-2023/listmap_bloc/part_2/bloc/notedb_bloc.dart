// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// import '../../../../../7_pair_Provider/cubit/with database/13th_pair_09-Dec-2023/app_db.dart';
// import '../../../../../7_pair_Provider/cubit/with database/13th_pair_09-Dec-2023/model/note_model.dart';
// import '../app_db.dart';
// import '../model/note_model.dart';
//
// part 'notedb_event.dart';
// part 'notedb_state.dart';
//
// class NotedbBloc extends Bloc<NotedbEvent, NotedbState> {
//   AppDataBase db;
//   NotedbBloc({required this.db}) : super(NotedbInitial()) {
//     ///add note
//     on<AddNoteEvent>((event, emit)  async{
//      emit(NotedbLoading());
//      var check = await db.addNote(event.newNote);
//      if(check) {
//        var listnotes = await db.fetchNotes();
//        emit(NotedbLoaded(allNotes: listnotes));
//      } else {
//        emit(NotedbError(errorMsg: "Note not added"));
//      }
//     });
//
//     ///fetch note
//     on<FetchAllNotes>((event, emit) async {
//       emit(NotedbLoading());
//       var listNotes= await db.fetchNotes();
//       emit(NotedbLoaded(allNotes: listNotes));
//     });
//   }
// }
//
