import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_starter/core/models/albums/album.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_clean_architecture_starter/ui/shared/ui_helper.dart';

import '../../../core/models/post/post.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import '/ui/shared/ui_helper.dart';
import '/ui/widgets/stateless/app_bar.dart';
import 'albums_view_model.dart';

// ignore: must_be_immutable
class AlbumsView extends StatefulWidget {
  Album album;

  AlbumsView(this.album);

  @override
  _AlbumsViewState createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(AlbumsView oldWidget) {
    // if (oldWidget.listPreferences != widget.listPreferences) {
    //   _pagingController.refresh();
    // }
    super.didUpdateWidget(oldWidget);
  }

  TextEditingController? commentController;
  FocusNode? commentFocusNode;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();

    commentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    commentController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumsViewModel>.reactive(
      viewModelBuilder: () => AlbumsViewModel(),
      onModelReady: (model) async {
        await model.init(context, widget.album);
      },
      builder: (context, model, child) => model.isBusy
          ? Scaffold(
              //  drawer: Drawer(child: CustomerDrawerMenu()),
              appBar: MyAppBar(),
              body: LoadingCircularProgressIndicator())
          : Scaffold(
              // drawer: Drawer(child: CustomerDrawerMenu()),
              appBar: MyAppBar(),
              body: model.isBusy
                  ? LoadingCircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Card(
                                  elevation: 0.4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        UIHelper.verticalSpaceMedium(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        4, 0, 4, 0),
                                                child: Text(
                                                  model.album!.title!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14),
                                                  //overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                      model.album!.id!
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .color!
                                                                  .withOpacity(
                                                                      0.6)),
                                                      textAlign:
                                                          TextAlign.center),
                                                ),
                                              ]),
                                        ),
                                        UIHelper.verticalSpaceMedium(),
                                        UIHelper.verticalSpaceMedium(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
    );
  }
}
