import 'package:auto_route/auto_route.dart';
import 'package:flutter_clean_architecture_starter/ui/views/albums_list/albums_list_view.dart';
import 'package:flutter_clean_architecture_starter/ui/views/albums_view/albums_view.dart';
import 'package:flutter_clean_architecture_starter/ui/views/posts_list/posts_list_view.dart';
import 'package:flutter_clean_architecture_starter/ui/views/posts_view/posts_view.dart';
import 'package:flutter_clean_architecture_starter/ui/views/settings/settings_view.dart';

import 'views/main/main_view.dart';
import 'views/startup/start_up_view.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page', routes: <AutoRoute>[
  AutoRoute(page: CustomerMainView),
  AutoRoute(page: StartUpView, initial: true),
  AutoRoute(page: AlbumsView),
  AutoRoute(page: AlbumsListView),
  AutoRoute(page: PostsView),
  AutoRoute(page: PostsListView),
  AutoRoute(page: SettingsView),
])
class $AppRouter {}
