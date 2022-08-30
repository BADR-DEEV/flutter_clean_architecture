import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_starter/ui/views/posts_list/paged_posts_list_view.dart';
import 'package:flutter_clean_architecture_starter/ui/views/posts_list/posts_list_view_model.dart';
import 'package:stacked/stacked.dart';
import '/ui/widgets/stateless/app_bar.dart';

// ignore: must_be_immutable
class PostsListView extends StatefulWidget {
  PostsListView();

  @override
  _PostsListViewState createState() => _PostsListViewState();
}

class _PostsListViewState extends State<PostsListView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(PostsListView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsListViewModel>.reactive(
      viewModelBuilder: () => PostsListViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
          // drawer: Drawer(child: CustomerDrawerMenu()),
          appBar: MyAppBar(),
          body: PagedPostsListView({
          }, onPostsClicked: (professional) async {

          })),
    );
  }
}
