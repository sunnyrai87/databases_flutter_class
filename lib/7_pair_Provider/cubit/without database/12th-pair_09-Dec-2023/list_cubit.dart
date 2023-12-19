import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListState(mData: []));

  /// add note
  void addNote(Map<String, dynamic> newNote) {
    emit(ListState(mData: state.mData, isLoading: true));
    Timer(Duration(seconds: 5), () {
      var random = Random().nextInt(100);
      print(random);
      if (random % 5 == 0) {
        ///error
        emit(ListState(
            mData: state.mData,
            isLoading: false,
            isError: true,
            errorMsg: "data not added"));
      } else {
        var currData = state.mData;
        currData.add(newNote);
        emit(ListState(mData: currData, isLoading: false, isError: false));
      }
    });
  }

  ///updatenote

  void updateNote(Map<String, dynamic> updateNote, int index) {
    var currData = state.mData;
    currData[index] = updateNote;
    emit(ListState(mData: currData));
  }

  ///
  void deleteNote(int index) {
    var currData = state.mData;
    currData.removeAt(index);
    emit(ListState(mData: currData));
  }
}
