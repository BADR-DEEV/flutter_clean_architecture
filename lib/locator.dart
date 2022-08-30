import 'dart:async';

import 'package:flutter_clean_architecture_starter/core/services/connectivity/connectivity_service.dart';
import 'package:flutter_clean_architecture_starter/core/services/connectivity/connectivity_service_impl.dart';
import 'package:flutter_clean_architecture_starter/core/services/http/http_service.dart';
import 'package:flutter_clean_architecture_starter/core/services/http/http_service_impl.dart';
import 'package:flutter_clean_architecture_starter/core/services/key_storage/key_storage_service.dart';
import 'package:flutter_clean_architecture_starter/core/services/key_storage/key_storage_service_impl.dart';
import 'package:flutter_clean_architecture_starter/core/services/navigation/navigation_service.dart';
import 'package:flutter_clean_architecture_starter/core/services/navigation/navigation_service_impl.dart';
import 'package:flutter_clean_architecture_starter/core/utils/file_helper.dart';
import 'package:get_it/get_it.dart';

import 'core/data_sources/albums/album_remote_data_source.dart';
import 'core/data_sources/posts/post_remote_data_source.dart';
import 'core/repositories/albums_repository/albums_repository.dart';
import 'core/repositories/posts_repository/posts_repository.dart';

GetIt locator = GetIt.instance;

/// Setup function that is run before the App is run.
///   - Sets up singletons that can be called from anywhere
/// in the app by using locator<Service>() call.
///   - Also sets up factor methods for view models.

Future<void> setupLocator() async {
  // Services

  locator.registerLazySingleton<NavigationService>(
    () => NavigationServiceImpl(),
  );

  locator.registerLazySingleton<ConnectivityService>(
    () => ConnectivityServiceImpl(),
  );

  locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  // Data sources

  locator.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(),
  );

  locator.registerLazySingleton<AlbumsRemoteDataSource>(
    () => AlbumsRemoteDataSourceImpl(),
  );

  locator.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl());
  locator.registerLazySingleton<AlbumsRepository>(() => AlbumsRepositoryImpl());

  await _setupSharedPreferences();

  // Utils
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());
}

Future<void> _setupSharedPreferences() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerLazySingleton<KeyStorageService>(() => instance!);
}
