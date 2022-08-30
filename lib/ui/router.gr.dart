// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../core/models/albums/album.dart' as _i10;
import '../core/models/post/post.dart' as _i11;
import 'views/albums_list/albums_list_view.dart' as _i4;
import 'views/albums_view/albums_view.dart' as _i3;
import 'views/main/main_view.dart' as _i1;
import 'views/posts_list/posts_list_view.dart' as _i6;
import 'views/posts_view/posts_view.dart' as _i5;
import 'views/settings/settings_view.dart' as _i7;
import 'views/startup/start_up_view.dart' as _i2;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    CustomerMainViewRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.CustomerMainView());
    },
    StartUpViewRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.StartUpView());
    },
    AlbumsViewRoute.name: (routeData) {
      final args = routeData.argsAs<AlbumsViewRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.AlbumsView(args.album));
    },
    AlbumsListViewRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.AlbumsListView());
    },
    PostsViewRoute.name: (routeData) {
      final args = routeData.argsAs<PostsViewRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.PostsView(args.post));
    },
    PostsListViewRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.PostsListView());
    },
    SettingsViewRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.SettingsView());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(CustomerMainViewRoute.name,
            path: '/customer-main-view'),
        _i8.RouteConfig(StartUpViewRoute.name, path: '/'),
        _i8.RouteConfig(AlbumsViewRoute.name, path: '/albums-view'),
        _i8.RouteConfig(AlbumsListViewRoute.name, path: '/albums-list-view'),
        _i8.RouteConfig(PostsViewRoute.name, path: '/posts-view'),
        _i8.RouteConfig(PostsListViewRoute.name, path: '/posts-list-view'),
        _i8.RouteConfig(SettingsViewRoute.name, path: '/settings-view')
      ];
}

/// generated route for
/// [_i1.CustomerMainView]
class CustomerMainViewRoute extends _i8.PageRouteInfo<void> {
  const CustomerMainViewRoute()
      : super(CustomerMainViewRoute.name, path: '/customer-main-view');

  static const String name = 'CustomerMainViewRoute';
}

/// generated route for
/// [_i2.StartUpView]
class StartUpViewRoute extends _i8.PageRouteInfo<void> {
  const StartUpViewRoute() : super(StartUpViewRoute.name, path: '/');

  static const String name = 'StartUpViewRoute';
}

/// generated route for
/// [_i3.AlbumsView]
class AlbumsViewRoute extends _i8.PageRouteInfo<AlbumsViewRouteArgs> {
  AlbumsViewRoute({required _i10.Album album})
      : super(AlbumsViewRoute.name,
            path: '/albums-view', args: AlbumsViewRouteArgs(album: album));

  static const String name = 'AlbumsViewRoute';
}

class AlbumsViewRouteArgs {
  const AlbumsViewRouteArgs({required this.album});

  final _i10.Album album;

  @override
  String toString() {
    return 'AlbumsViewRouteArgs{album: $album}';
  }
}

/// generated route for
/// [_i4.AlbumsListView]
class AlbumsListViewRoute extends _i8.PageRouteInfo<void> {
  const AlbumsListViewRoute()
      : super(AlbumsListViewRoute.name, path: '/albums-list-view');

  static const String name = 'AlbumsListViewRoute';
}

/// generated route for
/// [_i5.PostsView]
class PostsViewRoute extends _i8.PageRouteInfo<PostsViewRouteArgs> {
  PostsViewRoute({required _i11.Post post})
      : super(PostsViewRoute.name,
            path: '/posts-view', args: PostsViewRouteArgs(post: post));

  static const String name = 'PostsViewRoute';
}

class PostsViewRouteArgs {
  const PostsViewRouteArgs({required this.post});

  final _i11.Post post;

  @override
  String toString() {
    return 'PostsViewRouteArgs{post: $post}';
  }
}

/// generated route for
/// [_i6.PostsListView]
class PostsListViewRoute extends _i8.PageRouteInfo<void> {
  const PostsListViewRoute()
      : super(PostsListViewRoute.name, path: '/posts-list-view');

  static const String name = 'PostsListViewRoute';
}

/// generated route for
/// [_i7.SettingsView]
class SettingsViewRoute extends _i8.PageRouteInfo<void> {
  const SettingsViewRoute()
      : super(SettingsViewRoute.name, path: '/settings-view');

  static const String name = 'SettingsViewRoute';
}
