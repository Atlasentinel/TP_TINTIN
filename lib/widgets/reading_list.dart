import 'package:flutter/foundation.dart';
import 'package:tintin/models/album.dart';

class ReadingList extends ChangeNotifier {
 
  static final ReadingList _instance = ReadingList._internal();

  ReadingList._internal();

  factory ReadingList() {
    return _instance;
  }

  final List<Album> _albums = [];

  List<Album> get albums => _albums;

  void addAlbum(Album album) {
    _albums.add(album);
    notifyListeners();
  }

  void removeAlbum(Album album) {
    _albums.remove(album);
    notifyListeners();
  }

  bool isInList(Album album) {
    return _albums.contains(album);
  }

  void toggleInList(Album album) {
    if (isInList(album)) {
      removeAlbum(album);
    } else {
      addAlbum(album);
    }
  }
}
