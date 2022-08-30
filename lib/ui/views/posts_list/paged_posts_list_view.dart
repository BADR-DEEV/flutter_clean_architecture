import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_clean_architecture_starter/generated/l10n.dart';
import 'package:flutter_clean_architecture_starter/ui/views/posts_list/posts_list_view_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/stateless/indicators/error_indicator.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import '/core/constant/end_point_parameters.dart';
import '../../widgets/stateless/indicators/empty_list_indicator.dart';
import '../../../../locator.dart';
import '../../../core/models/post/post.dart';
import '../../../core/repositories/posts_repository/posts_repository.dart';
import '../../../core/services/navigation/navigation_service.dart';
import '../../router.gr.dart';
import '../../widgets/stateless/post_tile/post_tile.dart';

// ignore: must_be_immutable
class PagedPostsListView extends StatefulWidget {
  final ValueChanged<Post> onPostsClicked;
  Map<String, dynamic> parameters;

  PagedPostsListView(this.parameters, {required this.onPostsClicked});

  @override
  _PagedPostsItemsListViewViewState createState() =>
      _PagedPostsItemsListViewViewState();
}

class _PagedPostsItemsListViewViewState extends State<PagedPostsListView> {
  _PagedPostsItemsListViewViewState();

  final ScrollController? controller = ScrollController();

  final _pagingController = PagingController<int, Post>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  @override
  void didUpdateWidget(PagedPostsListView oldWidget) {
    // if (oldWidget.listPreferences != widget.listPreferences) {
    //   widget.pagingController.refresh();
    // }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var parameters = widget.parameters;

      parameters.putIfAbsent(EndPointParameter.PAGE, () => pageKey.toString());
      parameters[EndPointParameter.PAGE] = pageKey.toString();

      var items = await locator<PostsRepository>().fetchPostsList(parameters);

      _pagingController.appendLastPage(items);

      // the following code is used when you want to paginate the result. Don't forget to delete "_pagingController.appendLastPage(items)"


      /* if (items.isEmpty) {
        _pagingController.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(items, nextPageKey);
      }*/


    } catch (error) {
      print(error);
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsListViewModel>.reactive(
        viewModelBuilder: () => PostsListViewModel(),
        builder: (context, model, child) => PagedListView.separated(
              physics: BouncingScrollPhysics(),
              scrollController: controller,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Post>(
                itemBuilder: (context, post, index) => PostTile(
                    post: post,
                    onChanged: (value) async {
                      await locator<NavigationService>()
                          .pushNamed(PostsViewRoute(post: post), context);

                      //  return widget.onPostsClicked(value);
                    }),
                firstPageProgressIndicatorBuilder: (context) =>
                    LoadingCircularProgressIndicator(),
                newPageProgressIndicatorBuilder: (context) =>
                    LoadingCircularProgressIndicator(),
                firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                  error: _pagingController.error,
                  onTryAgain: () => _pagingController.refresh(),
                ),
                noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(
                  title: '${AppLocalizations.of(context).empty_list}', //
                  message: '${AppLocalizations.of(context).empty_list}', //
                ),
              ),
              padding: const EdgeInsets.all(4),
              separatorBuilder: (context, index) => const SizedBox(
                height: 0,
              ),
            ));
  }
}
