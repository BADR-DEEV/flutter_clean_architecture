import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_starter/core/models/albums/album.dart';
import 'package:flutter_clean_architecture_starter/ui/widgets/stateless/post_tile/post_tile_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/models/post/post.dart';
import 'album_tile_view.dart';

/// A list tile for an article.
class AlbumTile extends StatelessWidget {
  final Album? album;
  final ValueChanged<Album> onChanged;

  const AlbumTile({this.album, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumTileViewModel>.nonReactive(
      viewModelBuilder: () => AlbumTileViewModel(),
      onModelReady: (model) => model.init(album),
      builder: (context, model, child) => Card(
        margin: const EdgeInsets.only(left: 12, right: 12, top: 7, bottom: 7),
        elevation: 0.4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () async {
            return onChanged(album!);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                                child: Text(
                                  album!.title!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  album!.id!.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style: TextStyle(
                                      //height: 1.5,
                                      fontSize: 11,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color!
                                          .withOpacity(0.6)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
