import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_starter/core/models/albums/album.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/post/post.dart';

class AlbumsViewModel extends BaseViewModel {
  BuildContext? context;
  Album? album;
  Album? item;

  Future<void> init(BuildContext context, Album album) async {
    this.context = context;

    setBusy(true);

    this.album = album;

    setBusy(false);
  }
}
