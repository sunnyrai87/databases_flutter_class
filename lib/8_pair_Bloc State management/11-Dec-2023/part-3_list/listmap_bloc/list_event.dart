abstract class ListEvent {}

class AddMapEvent extends ListEvent {
  Map<String, dynamic> newMap;
  AddMapEvent({required this.newMap});
}

class FetchAllMap extends ListEvent {}

class UpdateMapEvent extends ListEvent {
  Map<String, dynamic> updateMap;
  int mIndex;
  UpdateMapEvent({required this.updateMap, required this.mIndex});
}

class DeleteMapEvent extends ListEvent {
  int mIndex;
  DeleteMapEvent({required this.mIndex});
}
