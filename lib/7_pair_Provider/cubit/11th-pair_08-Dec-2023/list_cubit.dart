// import 'package:databases_flutter_class/Provider/cubit/11th-pair_08-Dec-2023/list_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ListCubit extends Cubit <ListState>{
//   ListCubit() : super(ListState(mData: []));
//
//   /// add note
// void addNote (Map<String, dynamic> newNote){
//   var currData = state.mData;
//   currData.add(newNote);
//   emit(ListState(mData:currData));
//
// }
// ///updatenote
//
// void updateNote(Map<String, dynamic> updateNote, int index){
//   var currData = state.mData;
//   currData [index]= updateNote;
//   emit(ListState(mData: currData));
//
// }
// ///
// void deleteNote(int index){
//   var currData = state.mData;
//   currData.removeAt(index);
//   emit(ListState(mData: currData));
// }
// }