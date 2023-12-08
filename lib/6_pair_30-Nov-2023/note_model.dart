import 'package:databases_flutter_class/3_pair_27-Nov-2023/app_db.dart';

import 'app_db.dart';

class NoteModel {
  int user_id;
  int note_id;
  String note_title;
  String note_desc;

  NoteModel(
      {required this.note_id,
      required this.note_title,
      required this.note_desc,
      required this.user_id});

//fromMap --> Model
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      user_id: map[AppDataBase.COLUMN_USER_ID],
      note_id: map[AppDataBase.COLUMN_NOTE_ID],
      note_title: map[AppDataBase.COLUMN_NOTE_TITLE],
      note_desc: map[AppDataBase.COLUMN_NOTE_DESC],
    );
  }


// Model --> toMap
Map<String, dynamic> toMap() {
  return {
    //AppDataBase.COLUMN_NOTE_ID: note_id,
    AppDataBase.COLUMN_USER_ID: user_id,
    AppDataBase.COLUMN_NOTE_TITLE: note_title,
    AppDataBase.COLUMN_NOTE_DESC: note_desc,
  };
}
}