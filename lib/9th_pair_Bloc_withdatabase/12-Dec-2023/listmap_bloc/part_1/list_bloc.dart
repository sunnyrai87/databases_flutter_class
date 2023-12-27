// import 'package:databases_flutter_class/7_pair_Provider/cubit/without%20database/12th-pair_09-Dec-2023/list_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../8_pair_Bloc State management/11-Dec-2023/part-3_list/listmap_bloc/list_event.dart';
//
//
// class ListBloc extends Bloc<ListEvent, ListState> {
//   ListBloc() : super(ListState(mData: [])) {
//     on<AddMapEvent>((event, emit) {
//       var currData = state.mData;
//       currData.add(event.newMap);
//       emit(ListState(mData: currData));
//     });
//
//     on<FetchAllMap>((event, emit) {
//       emit(ListState(mData: state.mData));
//     });
//     on<UpdateMapEvent>((event, emit) {
//       var currData = state.mData;
//       currData[event.mIndex] = event.updateMap;
//       emit(ListState(mData: currData));
//     });
//
//     on<DeleteMapEvent>((event, emit) {
//       var currData = state.mData;
//       currData.removeAt(event.mIndex);
//       emit(ListState(mData: currData));
//     });
//   }
// }
