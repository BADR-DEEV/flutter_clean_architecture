import 'dart:async';

import 'package:flutter_clean_architecture_starter/core/models/albums/album.dart';
import 'package:logging/logging.dart';

import '../../data_sources/albums/album_remote_data_source.dart';
import '/core/exceptions/cache_exception.dart';
import '/core/exceptions/network_exception.dart';
import '/core/exceptions/repository_exception.dart';
import '/core/services/connectivity/connectivity_service.dart';
import '/locator.dart';
import '../../data_sources/posts/post_remote_data_source.dart';
import '../../models/post/post.dart';

abstract class AlbumsRepository {
  Future<Album> fetchPost([Map<String, dynamic>? parameters]);

  Future<List<Album>> fetchPostsList([Map<String, dynamic>? parameters]);
}

class AlbumsRepositoryImpl implements AlbumsRepository {
  final AlbumsRemoteDataSource? remoteDataSource =
      locator<AlbumsRemoteDataSource>();
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  final _log = Logger('AlbumsRepositoryImpl');

  @override
  Future<Album> fetchPost([Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.fetchPost(parameters);

        return data;
      }
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch locally');
      throw RepositoryException(e.message);
    }

    throw RepositoryException('null');
  }

  @override
  Future<List<Album>> fetchPostsList([Map<String, dynamic>? parameters]) async {
    try {
      final items = await remoteDataSource!.fetchPostsList(parameters);

      return items;
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch albums remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch aöbums locally');
      throw RepositoryException(e.message);
    }
  }
}
