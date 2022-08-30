import 'package:flutter_clean_architecture_starter/core/models/albums/album.dart';
import 'package:stacked/stacked.dart';

class AlbumTileViewModel extends BaseViewModel {
  Album? _album;

  Album? get album => _album;

  void init(Album? album) {
    _album = album;
  }
}
