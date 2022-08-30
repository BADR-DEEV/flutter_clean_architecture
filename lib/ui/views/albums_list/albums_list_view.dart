import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_starter/ui/views/albums_list/paged_albums_list_view.dart';
import 'package:flutter_clean_architecture_starter/ui/views/posts_list/paged_posts_list_view.dart';
import 'package:flutter_clean_architecture_starter/ui/views/posts_list/posts_list_view_model.dart';
import 'package:stacked/stacked.dart';
import '/ui/widgets/stateless/app_bar.dart';
import 'albums_list_view_model.dart';

// ignore: must_be_immutable
class AlbumsListView extends StatefulWidget {
  AlbumsListView();

  @override
  _AlbumsListViewState createState() => _AlbumsListViewState();
}

class _AlbumsListViewState extends State<AlbumsListView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(AlbumsListView oldWidget) {
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
    return ViewModelBuilder<AlbumsListViewModel>.reactive(
      viewModelBuilder: () => AlbumsListViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
       
          appBar: MyAppBar(),
          body:
              PagedAlbumsListView({}, onPostsClicked: (professional) async {})),
    );
  }
}
